class Player
  def initialize
    @score = 0
    @dices = 5
    @allow_save_score = false
    @winner = false
  end

  attr_accessor :score
  attr_accessor :name
  attr_accessor :dices
  attr_accessor :allow_save_score
  attr_accessor :winner
end