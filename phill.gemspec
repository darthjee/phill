# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phill/version'

Gem::Specification.new do |gem|
  gem.name          = 'phill'
  gem.version       = Phill::VERSION
  gem.authors       = ["Bidu Dev's Team"]
  gem.email         = ["dev@bidu.com.br"]
  gem.homepage      = 'https://github.com/Bidu/phill'
  gem.description   = 'Gem for easy log rotation and S3 upload'
  gem.summary       = gem.description

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f)  }
  gem.test_files    = gem.files.grep(%r{^(test|gem|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'activesupport'
  gem.add_runtime_dependency 'awscli'
  gem.add_runtime_dependency 'recursive-open-struct'
  gem.add_runtime_dependency 'minitar'

  gem.add_development_dependency "activerecord"
  gem.add_development_dependency "sqlite3"

  gem.add_development_dependency "bundler"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec", "~> 3.4.0"
  gem.add_development_dependency 'pry-nav'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'codeclimate-test-reporter'
end
