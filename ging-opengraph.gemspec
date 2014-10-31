# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ging-opengraph"
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.license = 'Intridea'
  s.authors = ["Michael Bleigh", "Matt Wilson"]
  s.date = "2012-04-23"
  s.description = "A very simple Ruby library for parsing Open Graph prototocol information from websites. See http://opengraphprotocol.org for more information."
  s.email = "social-stream@dit.upm.es"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "ging-opengraph.gemspec",
    "lib/opengraph.rb",
    "opengraph.gemspec",
    "spec/examples/partial.html",
    "spec/examples/rottentomatoes.html",
    "spec/opengraph_spec.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/ging/opengraph"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.12"
  s.specification_version = 3
  s.summary = "A very simple Ruby library for parsing Open Graph prototocol information from websites."

  s.add_runtime_dependency(%q<hashie>, "~> 3")
  s.add_runtime_dependency(%q<nokogiri>, "~> 1.5")
  s.add_runtime_dependency(%q<rest-client>, "~> 1.6")
  s.add_development_dependency(%q<rspec>, "~> 3.0")
  s.add_development_dependency(%q<webmock>, "~> 1")
end
