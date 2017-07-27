class Dice
  @@facets = 6
  @@rollFace

  def roll
    @@rollFace = rand (1..@@facets)
  end
end


