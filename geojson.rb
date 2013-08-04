require "json"
require "net/http"

failures = []

uri = URI.parse("http://geojsonlint.com/validate")
request = Net::HTTP::Post.new(uri.request_uri, { "content-type" => "application/json" })

Net::HTTP.start(uri.host, uri.port) do |http|
  Dir['*/**/*.geojson'].each do |geojson|
    request.body = IO.read((File.dirname(__FILE__) + "/#{geojson}"))

    response = http.request(request)

    failures << geojson unless JSON.parse(response.body) == { "status" => "ok" }
  end
end

if failures.any?
  puts "Broken GeoJSON: #{failures.join(", ")}"
  exit 1
end
