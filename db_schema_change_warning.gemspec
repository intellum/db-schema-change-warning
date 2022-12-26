Gem::Specification.new do |s|
  s.name        = "db_schema_change_warning"
  s.version     = "0.1"
  s.summary     = "Output warnings when a new Rails migration is run in development mode."
  s.description = "Output warnings when a new Rails migration is run in development mode."
  s.authors     = ["Florent Guilleux"]
  s.email       = "fguilleux@intellum.com"
  s.files       = Dir.glob("lib/**/*", File::FNM_DOTMATCH)
  s.homepage    = "https://github.com/intellum/db-schema-change-warning"
  s.license     = "MIT"
end
