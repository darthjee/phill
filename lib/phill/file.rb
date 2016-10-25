require 'zlib'
require 'archive/tar/minitar'

class Phill::File
  include Archive::Tar

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def compress
    Minitar.pack(path, gzip_file)
  end

  private

  def compressed_path
    @zip_name ||= "#{path}.tar.gz"
  end

  def gzip_file
    @gzip_file ||= Zlib::GzipWriter.open(compressed_path)
  end
end

