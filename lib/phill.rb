require 'recursive-open-struct'
require 'yaml'

class Phill
  require 'phill/version'
  require 'phill/configurable'
  require 'phill/aws_client'
  require 'phill/location'
  require 'phill/file'

  class << self
    include Phill::Configurable

    def locations
      @locations ||= config.locations.map { |l|  Location.new(l) }
    end

    def process
      locations.each(&:process)
      AwsClient.upload(locations)
    end
  end
end
