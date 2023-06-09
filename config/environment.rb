db_options = YAML.load(File.read('./config/database.yml'))
​
environment = ENV['APP_ENV'] || 'development'
ActiveRecord::Base.establish_connection(db_options[environment])

