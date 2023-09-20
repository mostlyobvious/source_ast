# frozen_string_literal: true

require_relative "source_ast/version"
require "parser/current"

module SourceAst
  class ExtractMethod < Parser::AST::Processor
    attr_reader :node

    def initialize(name)
      @expected_name = name
    end

    def on_def(node)
      name, * = *node
      @node = node if name == @expected_name
    end
  end

  def source_ast
    em = ExtractMethod.new(name)
    em.process(Parser::CurrentRuby.parse(File.read(source_location.first)))
    em.node
  end
end

Method.include(SourceAst)
