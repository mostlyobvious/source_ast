# frozen_string_literal: true

require_relative "source_ast/version"
require "parser/current"

module SourceAst
  class ExtractMethod < Parser::AST::Processor
    include AST::Sexp

    attr_reader :node

    def initialize(owner, name)
      @owner = owner
      @name = name
    end

    def on_class(node)
      if node.to_a[0] == s(:const, nil, owner)
        node.to_a[2].children.each do |c|
          @node = c if c.deconstruct[0..1] == [:def, name]
        end
      else
        super
      end
    end

    private attr_reader :owner, :name
  end

  def source_ast
    em = ExtractMethod.new(owner.name.to_sym, name)
    em.process(Parser::CurrentRuby.parse(File.read(source_location.first)))
    em.node
  end
end

Method.include(SourceAst)
