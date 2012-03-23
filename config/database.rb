require 'active_record'
db_settings = YAML.load_file(File.join(settings.root, 'config', 'database.yml'))[settings.environment.to_s]
ActiveRecord::Base.establish_connection(db_settings)
