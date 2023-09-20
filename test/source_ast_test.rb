require "minitest/autorun"
require "mutant/minitest/coverage"
require "source_ast"

class SourceAstTest < Minitest::Test
  cover SourceAst
end
