# Db Schema Change Warning

This gem outputs a warning when a Rails migration is run in development,
to request adding documentation to the Intellum data dictionary.

It should be used by any Intellum application whose data is ingested in the Intellum warehouse.

## Installation

Install this gem by adding to `Gemfile`:

```ruby
gem "db_schema_change_warning", git: "https://github.com/intellum/db_schema_change_warning"
```

in the `development` group and create the `config/initializers/warn_on_db_schema_change.rb` file with

```ruby
# Output warning when a new migration changes the DB schema.

if Rails.env.development?
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Migration.prepend(DbSchemaChangeWarning)
  end
end
```

## Local development

To test new changes locally without pushing first to GitHub:

* checkout the gem GH repo locally
* do your local changes in the gem directory
* run `gem build db_schema_change_warning.gemspec`
* in your local Exceed repo, change the inclusion of the gem in `Gemfile` to use `gem "db_schema_change_warning", path: "/path/to/your/local/db-schema-change-warning"`
* in your Exceed repo run `bundle install`
* create a new migration and run it: `rails g migration add_foo_to_users foo` and `rails db:migrate`
* -> check the output is what you expect

## Create a new version and make the applications use this new version

TODO
