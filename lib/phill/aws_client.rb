require 'recursive-open-struct'

class Phill::AwsClient
  class << self
    attr_reader :config

    def config=(hash)
      @config = RecursiveOpenStruct.new(hash)
    end
  end
end
