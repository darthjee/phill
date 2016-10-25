initializers = File.expand_path("config/initializers**/*.rb")
Dir[initializers].each { |file| require file  }
