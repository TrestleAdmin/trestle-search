require_relative 'lib/trestle/search/version'

Gem::Specification.new do |spec|
  spec.name          = "trestle-search"
  spec.version       = Trestle::Search::VERSION

  spec.authors       = ["Sam Pohlenz"]
  spec.email         = ["sam@sampohlenz.com"]

  spec.summary       = "Search plugin for the Trestle admin framework"
  spec.homepage      = "https://www.trestle.io"
  spec.license       = "LGPL-3.0-only"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  end

  spec.require_paths = ["lib"]

  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/TrestleAdmin/trestle-search"

  spec.add_dependency "trestle", "~> 0.10.0"

  spec.add_development_dependency "rspec-rails"
end
