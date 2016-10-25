require 'zlib'
require 'archive/tar/minitar'
require 'time'

class Phill::File
  include Archive::Tar

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def compress
    Minitar.pack(path, gzip_file)
  end

  def compressed_path
    @zip_name ||= "#{path}-#{date_string}.tar.gz"
  end

  def date_string
    Time.now.strftime '%Y%m%d'
  end

  def gzip_file
    @gzip_file ||= Zlib::GzipWriter.open(compressed_path)
  end
end

