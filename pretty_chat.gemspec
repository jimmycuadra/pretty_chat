# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pretty_chat/version"

Gem::Specification.new do |s|
  s.name        = "pretty_chat"
  s.version     = PrettyChat::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jimmy Cuadra"]
  s.email       = ["jimmy@jimmycuadra.com"]
  s.homepage    = ""
  s.summary     = %q{A command line tool to clean up chat logs.}
  s.description = %q{A command line tool to clean up chat logs.}

  s.rubyforge_project = "pretty_chat"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
