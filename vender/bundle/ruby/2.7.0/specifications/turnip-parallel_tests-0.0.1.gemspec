# -*- encoding: utf-8 -*-
# stub: turnip-parallel_tests 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "turnip-parallel_tests".freeze
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Wataru MIYAGUNI".freeze]
  s.date = "2013-08-23"
  s.description = "Helper ParallelTests for Turnip".freeze
  s.email = ["gonngo@gmail.com".freeze]
  s.homepage = "https://github.com/gongo/turnip-parallel_tests".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.6".freeze
  s.summary = "Helper ParallelTests for Turnip".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<parallel_tests>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  else
    s.add_dependency(%q<parallel_tests>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
