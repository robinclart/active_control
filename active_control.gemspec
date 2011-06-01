# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "active_control/version"

Gem::Specification.new do |s|
  s.name        = "active_control"

  s.version     = AccessControl::VERSION
  s.platform    = Gem::Platform::RUBY

  s.summary     = "Very simple authorization solution."
  s.description = "Very simple authorization solution with no depedencies. Each permission is stored in its class and authorizations are given through a two methods interface."

  s.authors     = ["Robin Clart"]
  s.email       = ["robin@charlin.be"]
  s.homepage    = "https://github.com/robinclart/active_control"

  s.rubyforge_project = s.name

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
