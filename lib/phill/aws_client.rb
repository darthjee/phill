require 'recursive-open-struct'
require 'awscli'

class Phill::AwsClient
  class << self
    include Phill::Configurable

    def upload(locations)
      locations.each do |location|
        location.files.each do |file|
          client.put_object(
            bucket: location.bucket,
            key: [ location.aws_folder, file.compressed_name ].join('/').gsub(/^\/*/,''),
            body: file.compressed_file,
            )
        end
      end
    end

    def client
      @client ||= Aws::S3::Client.new(
        access_key_id: config.access_key_id,
        secret_access_key: config.secret_access_key,
        region: config.region
      )
    end
  end
end
