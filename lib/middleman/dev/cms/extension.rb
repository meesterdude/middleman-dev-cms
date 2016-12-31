require 'middleman/dev/cms/api_server'

module Middleman
  module Dev
    module Cms
      # Middleman extension entry point
      class Extension < Middleman::Extension

        self.defined_helpers = []

        def initialize(app, options_hash = {}, &block)
          super
          app.map "/cms" do
            run ApiServer
          end

          #::Sprockets.register_preprocessor 'application/javascript', ::Sprockets::CoffeeReact
        end

        def after_configuration
        end

        def manipulate_resource_list(resources)
          # p "manipulate_resource_list"
          Dir.glob( "#{SOURCE_DIR}/**/*" ).each do |path|
            unless File.directory? path
              resources << make_template( path, path.gsub( /#{SOURCE_DIR}\//, "" ) )
            end
          end
          # resources << make_template( "#{SOURCE_DIR}/stylesheets/admin.css.scss", "stylesheets/admin.css" )
          resources
        end

        private
        def register_extension_templates
          # We call reload_path to register the templates directory with Middleman.
          # The path given to app.files must be relative to the Middleman site's root.
          #templates_dir_relative_from_root = Pathname(SOURCE_DIR).relative_path_from(Pathname(app.root))
          #app.files.reload_path(templates_dir_relative_from_root)
        end

        def make_template( file, name )
          name = name.gsub( /.erb/, "" ).gsub( /.haml/, "" ).gsub( /.coffee/, "" ).gsub( /.scss/, "" )
          # puts "Adding #{name}"
          Middleman::Sitemap::Resource.new(app.sitemap, name, file).tap do |resource|
            resource.add_metadata(options: { layout: false }, locals: {})
          end
        end
      end
    end
  end
end
