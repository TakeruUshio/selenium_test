# -*- encoding: utf-8 -*-
# stub: debug 1.11.0 ruby lib
# stub: ext/debug/extconf.rb

Gem::Specification.new do |s|
  s.name = "debug".freeze
  s.version = "1.11.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/ruby/debug/releases/tag/v1.11.0", "homepage_uri" => "https://github.com/ruby/debug", "source_code_uri" => "https://github.com/ruby/debug" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Koichi Sasada".freeze]
  s.bindir = "exe".freeze
  s.date = "2025-06-17"
  s.description = "Debugging functionality for Ruby. This is completely rewritten debug.rb which was contained by the ancient Ruby versions.".freeze
  s.email = ["ko1@atdot.net".freeze]
  s.executables = ["rdbg".freeze]
  s.extensions = ["ext/debug/extconf.rb".freeze]
  s.files = ["exe/rdbg".freeze, "ext/debug/extconf.rb".freeze]
  s.homepage = "https://github.com/ruby/debug".freeze
  s.licenses = ["Ruby".freeze, "BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.4.19".freeze
  s.summary = "Debugging functionality for Ruby".freeze

  s.installed_by_version = "3.4.19" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<irb>.freeze, ["~> 1.10"])
  s.add_runtime_dependency(%q<reline>.freeze, [">= 0.3.8"])
end
