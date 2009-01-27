#!/usr/bin/env ruby

require 'css_compressor'

input_file = ARGV[0]
exit if input_file.nil?
csscomp = CssCompressor.new(input_file)
csscomp.compress

puts "'#{csscomp.compressed_css}'"
puts "Original size = #{csscomp.original_size}, compressed size = #{csscomp.compressed_size}"
puts "Compression ration = #{csscomp.ratio}"

