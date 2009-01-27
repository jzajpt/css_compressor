#!/usr/bin/env ruby
#
# CSS compressor

class CssCompressor
  def initialize(input_file)
    @input_file = input_file
  end
  
  def compress
    read_original_css

    @compressed_css = @original_css.gsub(/\/\*.*?\*\//m, '')
    # TODO: remove multi-line comments
    
    tokens   = @compressed_css.split(/[ \t\n]/)
    @compressed_css = ''
    
    tokens = tokens - ['']

    tokens.each_with_index do |token, i|
      previous_token = tokens[i-1] if i > 0
      # last_character = previous_token[previous_token.length-1,1] if previous_token

      unless (previous_token && previous_token.match(/[:;}{,]\Z/)) || token.match(/\A[\{]/)
        @compressed_css << " "
      end
      @compressed_css << token
      puts "'#{token}'"
    end

    puts @compressed_css.strip
    original_length   = @original_css.length
    compressed_length = @compressed_css.length
    ratio             = compressed_length / original_length.to_f
    puts "Original size = #{original_length}, compressed size = #{compressed_length}"
    puts "Compression ration = #{ratio}"
  end
  
  protected
  
  def read_original_css
    File.open(@input_file) do |file|
      @original_css = file.read
    end
  end
end

input_file = ARGV[0]
exit if input_file.nil?
csscomp = CssCompressor.new(input_file)
csscomp.compress
