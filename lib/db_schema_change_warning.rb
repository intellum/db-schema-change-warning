module DbSchemaChangeWarning
  WARNING_OPERATIONS = %i(create_table create_join_table change_table change_column remove_column add_column
  change_column_default add_reference add_belongs_to remove_reference add_timestamps drop_join_table drop_table
  remove_timestamps rename_column rename_table)

  def migrate(direction) # Executed when a migration runs.
    @warn = false

    super

    # Output warning only if the migration is uncommited, because we don't want to warn other devs running the migration.
    if @warn && `git status db/migrate`.include?(self.version.to_s)
      puts
      puts "--> The data team needs to be told in advance about upcoming DB schema changes."
      puts
      puts "If you are adding new tables or columns please document them in the Data Dictionary through a pull request."
      puts "https://github.com/intellum/data_dictionary"
      puts
      puts "If you are adding a new table see these requirements:"
      puts "https://engineering-portal-internal.intellum.com/docs/wikis/ml-data/Requirements-for-tables-ingested-in-our-data-warehouse"
      puts
      puts "<-- Thanks!"
      puts
    end
  end

  def method_missing(method, *args) # Executed when a migration methods runs, e.g. add_column.
    @warn = true if method.in?(WARNING_OPERATIONS)
    super
  end
end

