require 'open-uri'
require_relative 'uri_util'

EXTENSION = ".html"

class FileDownloader

  def download(url, path)
    begin
      uri = UriUtil.new.parse(url)
      # FIX: set timeout code
      response = URI.open(uri)
      unless response.nil?
        output_file = File.new(File.join(path, "#{uri.host}#{EXTENSION}"), 'w')
        output_file.write response.read
      end
      puts "#{url} download successful."
    rescue Exception => err
      puts "* #{url} not found."
    end
  end
end