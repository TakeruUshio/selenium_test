# -*- encoding: utf-8 -*-
# stub: cuke_modeler 3.24.0 ruby lib

Gem::Specification.new do |s|
  s.name = "cuke_modeler".freeze
  s.version = "3.24.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/enkessler/cuke_modeler/issues", "changelog_uri" => "https://github.com/enkessler/cuke_modeler/blob/master/CHANGELOG.md", "documentation_uri" => "https://www.rubydoc.info/gems/cuke_modeler", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/enkessler/cuke_modeler" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Eric Kessler".freeze]
  s.date = "2025-02-24"
  s.description = "This gem facilitates modeling a test suite that is written in Gherkin (e.g. Cucumber, SpecFlow, Lettuce, etc.). It does this by providing an abstraction layer on top of the Abstract Syntax Tree that the 'cucumber-gherkin' gem generates when parsing features, as well as providing models for feature files and directories in order to be able to have a fully traversable model tree of a test suite's structure. These models can then be analyzed or manipulated more easily than the underlying AST layer.".freeze
  s.email = ["morrow748@gmail.com".freeze]
  s.homepage = "https://github.com/enkessler/cuke_modeler".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new([">= 2.3".freeze, "< 4.0".freeze])
  s.rubygems_version = "3.4.19".freeze
  s.summary = "A gem providing functionality to model Gherkin based test suites.".freeze

  s.installed_by_version = "3.4.19" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<cucumber-gherkin>.freeze, ["< 33.0"])
  s.add_development_dependency(%q<bundler>.freeze, ["< 3.0"])
  s.add_development_dependency(%q<childprocess>.freeze, ["< 6.0"])
  s.add_development_dependency(%q<cucumber>.freeze, [">= 4.0.0", "< 10.0.0"])
  s.add_development_dependency(%q<rainbow>.freeze, ["< 4.0.0"])
  s.add_development_dependency(%q<rake>.freeze, ["< 14.0.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  s.add_development_dependency(%q<rubocop>.freeze, ["< 2.0"])
  s.add_development_dependency(%q<simplecov>.freeze, ["< 1.0"])
  s.add_development_dependency(%q<simplecov-lcov>.freeze, ["< 1.0"])
  s.add_development_dependency(%q<test-unit>.freeze, ["< 4.0.0"])
  s.add_development_dependency(%q<yard>.freeze, ["< 1.0"])
end
