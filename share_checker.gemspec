# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "share_checker/version"

Gem::Specification.new do |s|
  s.name = "share_checker"
  s.version = ShareChecker::VERSION.dup
  s.platform = Gem::Platform::RUBY
  s.summary = "Insert ShareChecker summary."
  s.description = "Insert ShareChecker description."
  s.authors = ["Igor Galeta", "Pavlo Galeta"]
  s.email = "galeta.igor@gmail.com"
  s.homepage = "https://github.com/galetahub/share_checker"
  
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.test_files = Dir["{spec}/**/*"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.require_paths = ["lib"]
  
  s.add_runtime_dependency(%q<activesupport>, [">= 0"])
  s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
  s.add_runtime_dependency(%q<crack>, [">= 0"])
  s.add_runtime_dependency(%q<curb>, [">= 0"])
end
