require 'zlib'
require 'archive/tar/minitar'
require 'time'

class Phill::File
  include Archive::Tar

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def process
    compress
    File.open(path, 'w').close
  end

  def compressed_file
    @compressed_file ||= File.open(compressed_path, 'rb')
  end

  def compressed_name
    @compressed_name ||= compressed_path.gsub(/.*\//, '')
  end

  private

  def compress
    Minitar.pack(path, gzip_file)
  end

  def compressed_path
    @compressed_path ||= "#{path}-#{date_string}.tar.gz"
  end

  def date_string
    @date_string ||= Time.now.strftime '%Y%m%d'
  end

  def gzip_file
    @gzip_file ||= Zlib::GzipWriter.open(compressed_path)
  end
end

