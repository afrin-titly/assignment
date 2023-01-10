require 'open-uri'

class UriUtil
  def parse(url)
    uri = URI.parse(url)
    if uri.host.nil?
      # FIX: use from library
      uri = URI.parse("http://#{url}")
    end
    uri
  end
end
