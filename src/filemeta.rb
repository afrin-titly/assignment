class FileMeta
  attr_accessor :site, :num_links, :images, :last_fetch, :is_exist

  def initialize(url)
    @site = url
    @is_exist = true
  end

  def to_s
    if @is_exist
      "site: #{@site} \nnum_links: #{@num_links} \nimages: #{@images} \nlast_fetch: #{@last_fetch}"
    else
      "Invalid url: #{@site}"
    end
  end

end