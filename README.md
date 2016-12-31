# Middleman Dev CMS

This gem is a sinatra app meant to work with an a local middleman server to provide CRUD actions as well as integrate with git (coming soon!)

based on the the `middleman-blog-ui` gem

## Installation

1. Add `middleman-dev-cms` in your `Gemfile`.
2. Add `activate :dev_cms` in `config.rb`
3. Start `middleman server`
4. visit `/cms` + a page, such as [http://localhost:4567/cms/any/page/to/edit.html](http://localhost:4567/cms/any/page/to/edit.html) and you can create, update, move, rename and delete files from the middleman server

Still a work in progress! Better docs to come.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/middleman-dev-cms/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
