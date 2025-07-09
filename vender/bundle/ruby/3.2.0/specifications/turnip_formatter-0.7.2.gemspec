# -*- encoding: utf-8 -*-
# stub: turnip_formatter 0.7.2 ruby lib

Gem::Specification.new do |s|
  s.name = "turnip_formatter".freeze
  s.version = "0.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Wataru MIYAGUNI".freeze]
  s.date = "2019-10-04"
  s.description = "RSpec custom formatter for Turnip".freeze
  s.email = ["gonngo@gmail.com".freeze]
  s.homepage = "https://github.com/gongo/turnip_formatter".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.6".freeze
  s.summary = "RSpec custom formatter for Turnip".freeze

  s.installed_by_version = "3.4.6" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<turnip>.freeze, ["~> 3.1.0"])
  s.add_runtime_dependency(%q<rspec>.freeze, [">= 3.3", "< 4.0"])
  s.add_runtime_dependency(%q<activesupport>.freeze, [">= 4.2.7", "< 7.0"])
  s.add_development_dependency(%q<test-unit>.freeze, [">= 0"])
  s.add_development_dependency(%q<test-unit-rr>.freeze, [">= 0"])
  s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
  s.add_development_dependency(%q<sass>.freeze, [">= 0"])
  s.add_development_dependency(%q<bootstrap-sass>.freeze, [">= 0"])
  s.add_development_dependency(%q<oga>.freeze, [">= 0"])
end
