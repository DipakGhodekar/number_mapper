require_relative 'lib/number_mapper'
require 'benchmark'

word_combinations = []
puts "\nBenchmark:\n"
Benchmark.bm do |x|
  x.report { word_combinations = NumberMapper.new(number: ARGV[0]).search_word_combinations }
end
puts "\nWord Combinations for Number - `#{ARGV[0]}` are as follows\n\n"
puts word_combinations
