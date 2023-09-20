# frozen_string_literal: true

require_relative "lib/source_ast/version"

Gem::Specification.new do |spec|
  spec.name = "source_ast"
  spec.version = SourceAst::VERSION
  spec.license = "MIT"
  spec.authors = ["Paweł Pacana"]
  spec.email = ["pawel.pacana@gmail.com"]
  spec.summary = "Returns Parser AST for given method"
  spec.homepage = "https://github.com/pawelpacana/source_ast"
  spec.files = Dir["lib/**/*"]
  spec.require_paths = ["lib"]
  spec.extra_rdoc_files = %w[README.md]

  spec.metadata["homepage_uri"] = spec.homepage

  spec.required_ruby_version = ">= 2.7"

  spec.add_dependency "parser", "~> 3.0"
end
