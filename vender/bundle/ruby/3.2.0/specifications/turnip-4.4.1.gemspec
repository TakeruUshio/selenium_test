# -*- encoding: utf-8 -*-
# stub: turnip 4.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "turnip".freeze
  s.version = "4.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jonas Nicklas".freeze]
  s.date = "1980-01-01"
  s.description = "Provides the ability to define steps and run Gherkin files from with RSpec".freeze
  s.email = ["jonas.nicklas@gmail.com".freeze]
  s.homepage = "https://github.com/jnicklas/turnip/".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "3.4.19".freeze
  s.summary = "Gherkin extension for RSpec".freeze

  s.installed_by_version = "3.4.19" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rspec>.freeze, [">= 3.0", "< 4.0"])
  s.add_runtime_dependency(%q<cuke_modeler>.freeze, ["~> 3.15"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<pry>.freeze, [">= 0"])
  s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0"])
end
