# -*- encoding: utf-8 -*-
# stub: capistrano-rvm 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano-rvm"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kir Shatrov"]
  s.date = "2013-10-25"
  s.description = "RVM integration for Capistrano"
  s.email = ["shatrov@me.com"]
  s.homepage = "https://github.com/capistrano/rvm"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "RVM integration for Capistrano"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>, [">= 0"])
    else
      s.add_dependency(%q<capistrano>, [">= 0"])
    end
  else
    s.add_dependency(%q<capistrano>, [">= 0"])
  end
end
