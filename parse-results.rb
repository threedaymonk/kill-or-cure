require "hpricot"
require "fileutils"
require "open-uri"
require "digest/sha1"
require "progressbar"
require "csv"
require "iconv"

SEARCH = "http://www.dailymail.co.uk/home/search.html?pageOffset=%d&pageSize=50&orderBy=relevDesc&searchPhrase=cancer+risk&contenttype=article"
TEMP_DIR = File.join(File.dirname(__FILE__), "tmp")
FileUtils.mkdir_p(TEMP_DIR)

Result = Struct.new(:link, :summary)

def fetch_with_cache(uri)
  cache_path = File.join("tmp", Digest::SHA1.hexdigest(uri))
  unless File.exist?(cache_path)
    data = open(uri){ |f| f.read }
    open(cache_path, "w") do |cache|
      cache << data
    end
    return data
  end
  return File.read(cache_path)
end

first_page = fetch_with_cache(SEARCH % 1)
pages = first_page[/Page 1 of (\d+)/, 1].to_i
results = []

pbar = ProgressBar.new("Fetching results", pages)
iconv = Iconv.new("UTF-8", "Windows-1252")
(1 .. pages).each do |page|
  doc = Hpricot(fetch_with_cache(SEARCH % page))

  results += doc.search(".sch-result").map{ |node|
    link = node.at("a").attributes["href"]
    summary = iconv.iconv(node.at(".sch-res-preview").inner_text.strip)
    Result.new(link, summary)
  }

  pbar.inc
end
pbar.finish

CSV.open("results.csv", "w") do |csv|
  csv << ["What", "Effect", "Summary", "Link"]
  results.each do |r|
    csv << ["", "", r.summary, r.link]
  end
end
