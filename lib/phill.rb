require 'recursive-open-struct'
require 'yaml'

class Phill
  require './lib/phill/aws_client'
  require './lib/phill/location'

  class << self
    attr_reader :config

    def config=(hash)
      @config = RecursiveOpenStruct.new(hash, recurse_over_arrays: true)
    end

    def locations
      @locations ||= config.locations.map { |l|  Location.new(l) }
    end
  end
end

require './lib/phill/loader'
