#!/usr/bin/env ruby

require 'socket'

nodes = ["dog", "cat", "bird", "horse", "tree", "car", "phone"]

tags = ["work", "friend", "school"]

peers = ["peer1", "peer2", "peer3", "peer4"]

t = TCPSocket.new('localhost', 5204)

100.times do |i|

  peers.shuffle!
  nodes.shuffle!
  s = "add_node #{peers[0]} #{nodes[0]}"
  puts s
  t.puts s
  if rand(10) % 2 == 0
    t.puts "set_trusted #{peers[0]} #{nodes[0]}"
  end

  peers.shuffle!
  nodes.shuffle!
  tags.shuffle!
  s = "add_edge #{peers[0]} #{nodes[0]} #{nodes[1]} #{tags[0]} #{rand(2) + 1}.0"
  puts s
  t.puts s
  
  peers.shuffle!
  nodes.shuffle!
  tags.shuffle!
  # note that the visualization expects weights to be floating point...
  s = "update_edge #{peers[0]} #{nodes[0]} #{nodes[1]} #{tags[0]} #{rand(2) + 1}.0"
  puts s
  t.puts s
  
  sleep rand 0
end

# t.puts "add_node dog"
# 
# t.puts "add_node cat"
# 
# t.puts "add_node cat"
# 
# t.puts "add_edge dog cat work"
# 
# t.puts "update_edge dog cat work 3.0"