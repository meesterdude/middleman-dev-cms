# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require 'middleman/dev/cms/version'

Gem::Specification.new do |spec|
  spec.name          = "middleman-dev-cms"
  spec.version       = Middleman::Dev::Cms::VERSION
  spec.authors       = ["Russell Jennings", "Will Schenk"]
  spec.email         = ["violentpurr@gmail.com", 'wschenk@gmail.com']

  spec.summary       = %q{Developer focused CMS for middleman}
  spec.description   = %q{Provides CRUD abilities for pages as well as git operations when running server}
  spec.homepage      = "https://github.com/meesterdude/middleman-dev-cms"
  spec.license       = "MIT"
  spec.platform    = Gem::Platform::RUBY
  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # spec.add_dependency "middleman-react"

  spec.add_dependency "sinatra", "~> 1.4"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency("middleman-core", [">= 3.3"])
end
