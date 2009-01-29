require File.expand_path(File.dirname(__FILE__) + '/../lib/css_compressor')
require 'digest/sha2'
require 'fileutils'

describe CssCompressor, "working with file" do
  before(:all) do
    @hash = Digest::SHA1.hexdigest("#{Time.now.to_s}--#{rand}")
    @content = <<-EOF
    test
    {
      background-color: #fff;
    }
EOF
    @compressed = 'test{background-color:#fff;}'

    File.open(@hash, "w") do |file|
      file.puts @content
    end
    
    @csscomp = CssCompressor.new(@hash)
  end
  
  it "should read contents a file" do
    @csscomp.original_css.should == @content
  end
  
  it "should read file size" do
    @csscomp.original_size.should == @content.length
  end
  
  it "should set compressed css" do
    @csscomp.compress
    @csscomp.compressed_css.should == @compressed
  end
  
  it "should set size of compressed css" do
    @csscomp.compress
    @csscomp.compressed_size.should == @compressed.length
  end
  
  it "should compute compression ratio" do
    @csscomp.compress
    @csscomp.ratio.should == (@compressed.length / @content.length.to_f)
  end
  
  after(:all) do
    FileUtils.rm(@hash)
  end
end
