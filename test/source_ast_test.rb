require "minitest/autorun"
require "mutant/minitest/coverage"
require "source_ast"
require_relative "fixture"

class SourceAstTest < Minitest::Test
  cover SourceAst

  class Subject
    include AST::Sexp

    def initialize(scope)
      @scope = scope
    end

    def responds_to_source_ast?
      subject.respond_to?(:source_ast)
    end

    def returns_expected_source_ast?
      subject.source_ast == subject_ast
    end

    private

    def subject_ast
      s(:def, :call, s(:args), s(:send, nil, :puts, s(:str, "kaka dudu")))
    end

    def subject
      @scope.method(:call)
    end
  end

  def test_subject_responds_to_source_ast
    [Subject.new(Fixture.new)].each do |subject|
      assert subject.responds_to_source_ast?
    end
  end

  def test_subject_source_ast_returns_parser_ast
    [Subject.new(Fixture.new)].each do |subject|
      assert subject.returns_expected_source_ast?
    end
  end
end
