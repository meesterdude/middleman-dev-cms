require 'sinatra'
require 'fileutils'

module Middleman
  module Dev
    module Cms
      class ApiServer < Sinatra::Base

        get '/rebuild' do
          `bundle exec middleman build`
          erb :rebuild
        end

        # get filepath
        get '/*' do
          filepath = params['captures'].first
          filepath +="index.html" if filepath.end_with?("/")
          filepath += ".html" unless filepath.end_with?(".html")
          if found_filepath = Dir.glob("#{SOURCE_DIR + "/" + filepath}*").first
            filepath += found_filepath.partition(".html").last
            content = File.open(found_filepath).read
          else
            filepath += ".erb"
            content = %Q(
---
title: Clever Title
description: So I know what im looking at
---

)
          end
          erb :index, locals: {content: content, filepath: (filepath)}
        end
        # if filepath matches new and doesnt exist, create it recursivly
        #    if they dont match, user edited field
        # if newfilepath does not match filepath, perform move
        # if newfilepath is blank, delete
        post "/" do
          full_filepath = SOURCE_DIR + "/" + params[:filepath]
          original_filepath = SOURCE_DIR + "/" + params[:originalfilepath]
          existing = Dir.glob("#{full_filepath}*").first
          if params[:filepath].empty? # they want to delete this file
            `rm "#{original_filepath}"`
            redirect to("http://" + request.host_with_port + "/") and return
          elsif full_filepath != original_filepath && !existing # lets move or rename
            found = Dir.glob("#{original_filepath}*").first  # find the known original
            dest_full_filepath = full_filepath
            `mkdir -p "#{dest_full_filepath.rpartition("/").first}"`
            `mv "#{found}" "#{dest_full_filepath}"`

            existing = dest_full_filepath
          end
          File.open(existing || full_filepath, "w+") {|f| f.write(params[:content]) }

          sleep(0.6)
          redirection = "http://" + request.host_with_port + "/" + params[:filepath].gsub(/\s/, "%20").gsub(/.md|.erb/, '')
          redirect to(redirection)
        end

        private

        def load_app
          opts = {}

          app = ::Middleman::Application.server.inst do
            set :environment, opts[:environment].to_sym if opts[:environment]
            logger
          end

          app
        end

        def logger
          ::Middleman::Logger.singleton( 1 )
        end
      end
    end
  end
end
