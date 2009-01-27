#!/usr/bin/env ruby
#
# CSS compressor
#
# Author::    Jiri Zajpt  (mailto:jzajpt@blueberry.cz)
# Copyright:: Copyright (c) 2009 Jiri Zajpt


class CssCompressor
  attr_accessor :compressed_css
  attr_accessor :original_css
  attr_accessor :original_size
  attr_accessor :compressed_size
  attr_accessor :ratio

  def initialize(input_file)
    @input_file = input_file
  end
  
  # Reads given input CSS file and compresses it in memory.
  def compress
    read_original_css

    @compressed_css = @original_css.gsub(/\/\*.*?\*\//m, '')
    
    tokens   = @compressed_css.split(/[ \t\n]/)
    @compressed_css = ''
    
    tokens = tokens - ['']

    tokens.each_with_index do |token, i|
      previous_token = tokens[i-1] if i > 0

      unless (previous_token && previous_token.match(/[:;}{,]\Z/)) || token.match(/\A[\{]/)
        @compressed_css << " "
      end
      @compressed_css << token
    end

    @compressed_size = @compressed_css.length
    @ratio           = @compressed_size / @original_size.to_f
  end
  
  # Reads given input CSS, compresses it and overwrites original file with compressed CSS. 
  def compress!
    compress
    
    File.open(@input_file, 'w') do |file|
      file.puts @compressed_css
    end
  end
  
  protected
  
  def read_original_css
    File.open(@input_file) do |file|
      @original_css  = file.read
    end
    @original_size = File.size(@input_file)
  end
end

input_file = ARGV[0]
exit if input_file.nil?
csscomp = CssCompressor.new(input_file)
csscomp.compress!

puts "#{csscomp.compressed_css}"
puts "Original size = #{csscomp.original_size}, compressed size = #{csscomp.compressed_size}"
puts "Compression ration = #{csscomp.ratio}"

