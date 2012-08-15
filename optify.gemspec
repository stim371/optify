# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "optify/version"

Gem::Specification.new do |s|
  s.name        = "optify"
  s.version     = Optify::VERSION
  s.authors     = ["Joel Stimson"]
  s.email       = ["contact@cleanroomstudios.com"]
  s.homepage    = "https://github.com/stim371/optify"
  s.summary     = %q{Ruby wrapper for Optify API}
  s.description = %q{This gem provides ruby bindings for the Optify API, allowing you to access the visitor and lead data for sites on your account.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "rake"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"
  s.add_development_dependency "simplecov"
  
  s.add_runtime_dependency "httparty"
end
