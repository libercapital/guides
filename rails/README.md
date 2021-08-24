# Rails

- Use private instead of protected when defining controller methods.
- Name date columns with `_on` suffixes.
- Name datetime columns with `_at` suffixes.
- Name time columns (referring to a time of day with no date) with `_time`
  suffixes.
- Name initializers for their gem name.
- Order ActiveRecord associations above ActiveRecord validations.
- Put application-wide partials in the [`app/views/application`] directory.
- Use `def self.method`, not the `scope :method` DSL.
- Use `link_to` for GET requests, and `button_to` for other HTTP verbs.
- Use new-style `validates :name, presence: true` validations, and put all
  validations for a given column together.
- Avoid bypassing validations with methods like `save(validate: false)`,
  `update_attribute`, and `toggle`.
- Avoid naming methods after database columns in the same class.
- Don't reference a model class directly from a view.
- Don't use instance variables in partials. Pass local variables to partials
  from view templates.
- Keep `db/schema.rb` under version control.
- Use only one instance variable in each view.
- Use the [`.ruby-version`] file convention to specify the Ruby version and
  patch level for a project.
- Use `db/seeds.rb` for data that is required in non production environments.
- Prefer `cookies.signed` over `cookies` to [prevent tampering].
- Prefer `Time.zone.parse("2014-07-04 16:05:37")` over `Time.parse("2014-07-04
  16:05:37")`.
- Use `ENV.fetch` for environment variables instead of `ENV[]`so that unset
  environment variables are detected on deploy.
- Use `includes` when you need to use data from associated tables (eager loading) [Example](/rails/sample.rb#L9)
- Use `joins` when you need only the associated tables data to some sort of filter (lazy loading) [Example](/rails/sample.rb#L16)

# DDD

- Use `Vendor::LegalDataRepository` instead of `Repository::Vendor::LegalDataRepository`
  or `Repository::VendorLegalData`.
