require 'nokogiri'
require 'open-uri'
require 'uri'
require_relative 'filemeta'
require_relative 'file_downloader'
require_relative 'uri_util'


class FileMetaExtractor

  def extract_meta_info(full_path, meta)
    begin
      if File.exist?(full_path)
        html = Nokogiri::HTML.parse(File.open("#{full_path}", 'r'))
        meta.num_links = html.search('a').count
        meta.images = html.search('img').count
        last_fetch = File.stat(full_path).ctime.strftime("%a %b %d %Y %H:%M %z")
        meta.last_fetch = last_fetch
      else
        meta.is_exist = false
      end
    rescue Exception => err
      puts err.message
    end
  end

  def get_file_meta(urls, path)
    files_meta = []

    urls.each do |url|
      uri = UriUtil.new.parse(url)
      filename = File.join(path, "#{uri.host}#{EXTENSION}")
      unless File.exist?(filename)
          FileDownloader.new.download(url, path)
        puts "---------------------------------------------"
      end
      meta = FileMeta.new(url)
      files_meta << meta

      extract_meta_info(filename, meta)
    end
    files_meta
  end

end