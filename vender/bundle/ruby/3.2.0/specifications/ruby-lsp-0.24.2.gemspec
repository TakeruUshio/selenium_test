# -*- encoding: utf-8 -*-
# stub: ruby-lsp 0.24.2 ruby lib

Gem::Specification.new do |s|
  s.name = "ruby-lsp".freeze
  s.version = "0.24.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "documentation_uri" => "https://shopify.github.io/ruby-lsp/" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Shopify".freeze]
  s.bindir = "exe".freeze
  s.date = "1980-01-02"
  s.description = "An opinionated language server for Ruby".freeze
  s.email = ["ruby@shopify.com".freeze]
  s.executables = ["ruby-lsp".freeze, "ruby-lsp-check".freeze, "ruby-lsp-launcher".freeze, "ruby-lsp-test-exec".freeze]
  s.files = ["exe/ruby-lsp".freeze, "exe/ruby-lsp-check".freeze, "exe/ruby-lsp-launcher".freeze, "exe/ruby-lsp-test-exec".freeze]
  s.homepage = "https://github.com/Shopify/ruby-lsp".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0".freeze)
  s.rubygems_version = "3.4.19".freeze
  s.summary = "An opinionated language server for Ruby".freeze

  s.installed_by_version = "3.4.19" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<language_server-protocol>.freeze, ["~> 3.17.0"])
  s.add_runtime_dependency(%q<prism>.freeze, [">= 1.2", "< 2.0"])
  s.add_runtime_dependency(%q<rbs>.freeze, [">= 3", "< 5"])
  s.add_runtime_dependency(%q<sorbet-runtime>.freeze, [">= 0.5.10782"])
end
