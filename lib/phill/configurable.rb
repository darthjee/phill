module Phill::Configurable
  attr_reader :config

  def config=(hash)
    @config = RecursiveOpenStruct.new(hash, recurse_over_arrays: true)
  end
end
