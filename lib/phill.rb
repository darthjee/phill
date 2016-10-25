require 'recursive-open-struct'
require 'yaml'

class Phill
  require './lib/phill/configurable'
  require './lib/phill/aws_client'
  require './lib/phill/location'
  require './lib/phill/file'

  class << self
    include Phill::Configurable

    def locations
      @locations ||= config.locations.map { |l|  Location.new(l) }
    end

    def process
      locations.each(&:process)
    end
  end
end

require './lib/phill/loader'
