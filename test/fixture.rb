class Fixture
  def kaka
    puts "dudu"
  end

  def call
    puts "kaka dudu"
  end

  def dudu
    puts "kaka"
  end

  module SomethingElse
    def call
      puts "dudu kaka"
    end
  end
end
