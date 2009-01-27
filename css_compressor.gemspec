Gem::Specification.new do |s|
  s.name        = "css_compressor"
  s.version     = "0.1.0"
  s.date        = "2009-01-27"
  s.summary     = "CSS compressor library."
  s.email       = "jzajpt@blueberry.cz"
  s.author      = "Jiri Zajpt"
  s.homepage    = "http://github.com/jzajpt/css-compressor"
  s.description = "CSS Compressor is a simple Ruby library for compressing CSS files."
  s.require_paths = ["lib"]
  s.has_rdoc    = true
  s.rdoc_options = ["--main", "README.rdoc"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files       = [
    "README.rdoc",
		"css_compressor.gemspec", 
		"lib/css_compressor.rb"]
end
