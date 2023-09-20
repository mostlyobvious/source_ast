require "minitest/autorun"
require "mutant/minitest/coverage"
require "source_ast"
require_relative "fixture"

class SourceAstTest < Minitest::Test
  cover SourceAst

  include AST::Sexp

  def call_ast
    s(:def, :call,
      s(:args),
      s(:send, nil, :puts, s(:str, "kaka dudu")))
  end

  def subject
    Fixture.new.method(:call)
  end

  def test_subject_responds_to_source_ast
    assert_respond_to subject, :source_ast
  end

  def test_subject_source_ast_returns_parser_ast
    assert_equal call_ast, subject.source_ast
  end
end
