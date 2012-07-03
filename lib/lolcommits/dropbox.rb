require 'dropbox_sdk'

module Lolcommits
  module Dropbox
    def self.upload(file_path)
      secret_path = File.join(File.dirname(__FILE__), 'secret.txt')
      return if not File.exists?(secret_path)

      secret = File.read(secret_path)
      session = DropboxSession.deserialize(secret)
      client = DropboxClient.new(session, :dropbox)

      file_name = File.basename(file_path)

      file = open(file_path)
      client.put_file("/Public/#{file_name}", file)
      file.close
    end
  end
end
