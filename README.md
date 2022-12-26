# Db Schema Change Warning

This gem outputs a warning when a Rails migration is run in development,
to request adding documentation to the Intellum data dictionary.

It should be used by any Intellum application whose data is ingested in the Intellum warehouse.

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
