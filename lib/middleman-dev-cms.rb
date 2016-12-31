# encoding: UTF-8

require 'middleman-core'

::Middleman::Extensions.register(:dev_cms) do
  module Middleman::Dev::Cms
    SOURCE_DIR ||= File.expand_path(File.join('..', '..', 'source'), __FILE__)
  end
  require 'middleman/dev/cms/extension'
  ::Middleman::Dev::Cms::Extension
end
