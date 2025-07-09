# -*- encoding: utf-8 -*-
# stub: turnip 3.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "turnip".freeze
  s.version = "3.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jonas Nicklas".freeze]
  s.date = "2018-02-01"
  s.description = "Provides the ability to define steps and run Gherkin files from with RSpec".freeze
  s.email = ["jonas.nicklas@gmail.com".freeze]
  s.homepage = "".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.6".freeze
  s.summary = "Gherkin extension for RSpec".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rspec>.freeze, [">= 3.0", "< 4.0"])
    s.add_runtime_dependency(%q<gherkin>.freeze, ["~> 5.0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rspec>.freeze, [">= 3.0", "< 4.0"])
    s.add_dependency(%q<gherkin>.freeze, ["~> 5.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
  end
end
