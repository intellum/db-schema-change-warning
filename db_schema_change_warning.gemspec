Gem::Specification.new do |s|
  s.name        = "db_schema_change_warning"
  s.version     = "0.2"
  s.summary     = "Output warnings when a new Rails migration is run in development mode."
  s.description = "Output warnings when a new Rails migration is run in development mode."
  s.authors     = ["Florent Guilleux"]
  s.email       = "fguilleux@intellum.com"
  s.files       = Dir.glob("lib/**/*", File::FNM_DOTMATCH)
  s.homepage    = "https://github.com/intellum/db-schema-change-warning"
  s.license     = "MIT"
  s.required_ruby_version = '>= 3.0.6'
end
