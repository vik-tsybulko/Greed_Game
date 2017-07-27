require_relative './game.rb'
require_relative './output_on_console.rb'
require_relative './input_parameter.rb'
require_relative './player.rb'
require_relative './dice.rb'
require_relative './calculation_of_result.rb'
class Start
  output = OutputOnConsole.new
  input = InputParameter.new


  output.enterNumberOfPlayers
  output.enterNamePlayer(input.enterCountUsers)
  game = Game.new($users)
  calc = CalculationOfResult.new(input.get_final_score)

  loop do
    $users.each do |player|
      puts "Ходит #{player.name}"
      output.rollDice
      game.whichCombination(player)
      game.putsScore(player)
    end
    # calc.who_winner($users)
    calc.is_end
    end_end = false
    $users.each do |player|
      if player.winner == true
        end_end = true
      end
    end
    if end_end == true
      break
    end
  end
  puts "Финальный круг, в нем принимают участие:"
participants =[]
  $users.each do |player|
    if player.winner == false
      participants << player
    end
  end
  participants.each do |player|
    print "#{player.name} "
  end
  puts
  participants.each do |player|

    puts "Ходит #{player.name}"
    output.rollDice
    game.whichCombination(player)
    game.putsScore(player)
  end

  puts "Поздравляем #{calc.who_winner($users)} с победой!!!"

end
#баги:
# 1. Когда у нескольких пользователей одинаковый результат выдает последнего из них
# 2. Завершает программу если ввести в количество игроков не цифру
# 4. Когда выпало 4 пятерки - посчитало по 50 очков, вместо 500 + 50
# 5.