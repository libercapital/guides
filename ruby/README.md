# Ruby

- Avoid multiple assignments per line (`one, two = 1, 2`).
- Avoid organizational comments (`# Validations`).
- Avoid ternary operators (`boolean ? true : false`). Use multi-line `if`
  instead to emphasize code branches.
- Prefer nested class and module definitions over the shorthand version
  [Example](/ruby/sample.rb#L1)
- Prefer `detect` over `find`.
- Prefer `select` over `find_all`.
- Prefer `map` over `collect`.
- Prefer `reduce` over `inject`.
- Prefer `&:method_name` to `{ |item| item.method_name }` for simple method
  calls.
- Use `_` for unused block parameters.
- Prefix unused variables or parameters with underscore (`_`).
- Use `%()` for single-line strings containing double-quotes that require
  interpolation.
- Use `?` suffix for predicate methods.
- Use `def self.method`, not `class << self`.
- Use `def` with parentheses when there are arguments.
- Use heredocs for multi-line strings.
- Order class methods above instance methods.
- Prefer method invocation over instance variables.
- Avoid optional parameters. Does the method do too much?
- Avoid monkey-patching.
- Prefer classes to modules when designing functionality that is shared by
  multiple models.
- Prefer `private` when indicating scope.

## Bundler

- Specify the [Ruby version] to be used on the project in the `Gemfile`.
- Use a [pessimistic version] in the `Gemfile` for gems that follow semantic
  versioning, such as `rspec`, `factory_bot`, and `capybara`.
- Use a [versionless] `Gemfile` declarations for gems that are safe to update
  often, such as pg, thin, and debugger.
- Use an [exact version] in the `Gemfile` for fragile gems, such as Rails.

[ruby version]: http://bundler.io/v1.3/gemfile_ruby.html
[exact version]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle
[pessimistic version]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle
[versionless]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle

## Ruby Gems

- Use [Bundler] to manage the gem's dependencies.

[bundler]: http://bundler.io

## Ruby JSON APIs

- Review the recommended practices outlined in Heroku's [HTTP API Design Guide]
  before designing a new API.
- Write integration tests for your API endpoints. When the primary consumer of
  the API is a JavaScript client maintained within the same code base as the
  provider of the API, write [feature specs]. Otherwise write [request specs].

[http api design guide]: https://github.com/interagent/http-api-design
[feature specs]: https://www.relishapp.com/rspec/rspec-rails/docs/feature-specs/feature-spec
[request specs]: https://www.relishapp.com/rspec/rspec-rails/docs/request-specs/request-spec
