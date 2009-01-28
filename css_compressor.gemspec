Gem::Specification.new do |s|
  s.name        = "css_compressor"
  s.version     = "0.1.0"
  s.date        = "2009-01-27"
  s.summary     = "CSS compressor library."
  s.email       = "jzajpt@blueberry.cz"
  s.author      = "Jiri Zajpt"
  s.homepage    = "http://github.com/jzajpt/css_compressor"
  s.description = "CSS Compressor is a simple Ruby library for compressing CSS files."
  s.rubyforge_project = "css_compressor"
  s.require_path     = "lib"
  s.default_executable = "csscomp"
  s.executables      = ["csscomp"]
  s.has_rdoc         = true
  s.rdoc_options     = ["--main", "README.rdoc"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files            = [
    "README.rdoc",
		"css_compressor.gemspec",
		"bin/csscomp",
		"lib/css_compressor.rb",
  	"spec/css_compressor_spec.rb"]
end
