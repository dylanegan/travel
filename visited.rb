# encoding: UTF-8

total = 0.0
unvisited = 0

Dir['*/**/*.md'].each do |destination|
  File.open(File.dirname(__FILE__) + "/#{destination}").readlines.each do |line|
    next unless line[/^\* /]

    total += 1
    unvisited += 1 if line[/~~/] || destination[/TBD|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec/]
  end
end

percentage = (unvisited / total * 100)
if percentage > 50.0
  puts "The only thing that can keep you from succeeding is yourself. (#{"%.2f" % percentage}% unvisited)"
  exit 1
end

puts "To travel is to discover that everyone is wrong about other countries. (#{"%.2f" % percentage}% unvisited)"
