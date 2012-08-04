total = 0.0
unvisited = 0

Dir['*/**/*.md'].each do |destination|
  File.open(File.dirname(__FILE__) + "/#{destination}").readlines.each do |line|
    next unless line[/^\* /]

    total += 1
    unvisited += 1 if line[/~~/]
  end
end

if (unvisited / total * 100) > 50.0
  puts "The only thing that can keep you from succeeding is yourself."
  exit 1
end

puts "To travel is to discover that everyone is wrong about other countries."
