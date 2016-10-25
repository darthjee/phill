require 'zlib'

class Phill::File
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def compress
    gzip_file.write(data)
    gzip_file.close
  end

  private

  def compressed_path
    @zip_name ||= "#{path}.gz"
  end

  def gzip_file
    @gzip_file ||= Zlib::GzipWriter.open(compressed_path)
  end

  def data
    @data ||= File.read(path)
  end
end

