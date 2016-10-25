require 'recursive-open-struct'
require 'yaml'

class Phill
  require './lib/phill/aws_client'

  class << self
    attr_reader :config

    def config=(hash)
      @config = RecursiveOpenStruct.new(hash)
    end
  end
end

require './lib/phill/loader'
