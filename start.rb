require_relative './game.rb'
require_relative './output_on_console.rb'
require_relative './input_parameter.rb'
require_relative './player.rb'
require_relative './dice.rb'
require_relative './calculation_of_result.rb'
class Start
  output = OutputOnConsole.new
  input = InputParameter.new
  calc = CalculationOfResult.new

  output.enterNumberOfPlayers
  output.enterNamePlayer(input.enterCountUsers)
  game = Game.new($users)

  loop do
    $users.each do |player|
      puts "Ходит #{player.name}"
      output.rollDice
      game.whichCombination(player)
      game.putsScore(player)
    end
    calc.winner($users)

    break if input.iscontinue == false
  end

end
#баги:
# 1. Когда у двух пользователей одинаковый результат выдает одного из них
# 2. Завершает программу если ввести в количество игроков букву
# 3.