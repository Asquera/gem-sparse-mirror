# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gem-sparse-mirror/version'

Gem::Specification.new do |gem|
  gem.name          = "gem-sparse-mirror"
  gem.version       = Gem::Sparse::Mirror::VERSION
  gem.authors       = ["Florian Gilcher"]
  gem.email         = ["florian.gilcher@asquera.de"]
  gem.description   = %q{Builds a sparse rubygems mirror that contains all dependencies of the included gems.}
  gem.summary       = %q{Builds a sparse rubygems mirror that contains all dependencies of the included gems.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rubygems-mirror"
  gem.add_dependency "bundler"
end
