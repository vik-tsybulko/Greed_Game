require_relative './player.rb'
require_relative './output_on_console.rb'
class Game
  def initialize(players)
    @players = players
  end
  @@scoreInRound = 0
  @@output = OutputOnConsole.new
  @@combination = {0.1 => 0,
                   0.2 => 0,
                   0.3 => 0,
                   0.4 => 0,
                   0.5 => 0,
                   0.6 => 0,
                   1.1 => 100,
                   1.2 => 0,
                   1.3 => 0,
                   1.4 => 0,
                   1.5 => 50,
                   1.6 => 0,
                   2.1 => 200,
                   2.2 => 0,
                   2.3 => 0,
                   2.4 => 0,
                   2.5 => 100,
                   2.6 => 0,
                   3.1 => 1000,
                   3.2 => 200,
                   3.3 => 300,
                   3.4 => 400,
                   3.5 => 500,
                   3.6 => 600,
                   4.1 => 400,
                   4.2 => 0,
                   4.3 => 0,
                   4.4 => 0,
                   4.5 => 200,
                   4.6 => 0,
                   5.1 => 1200,
                   5.2 => 200,
                   5.3 => 300,
                   5.4 => 400,
                   5.5 => 600,
                   5.6 => 600,
  }
  def rollDice(countDice, namePlayer)
    @@res = []
    @@dices = []
    countDice.times do |i|
      @@dices << Dice.new
    end
    @@dices.each do |dice|
      @@res << dice.roll
    end

    @@output.resultRollOfDice(@@res, namePlayer)
    return @@res
  end

  def whichCombination(player)
    @@isZonk = true
    @@scoreInRoll = 0
    res = rollDice(player.dices, player.name)

    res.uniq.each do |i|
      if @@combination["#{res.count(i)}.#{i}".to_f] != 0
        @@scoreInRoll += @@combination["#{res.count(i)}.#{i}".to_f]
        player.dices -= res.count(i)
        @@isZonk = false
      end
    end
    @@scoreInRound += @@scoreInRoll
    if @@isZonk == true
      puts "Вам не повезло, в этом броске нет комбинаций, очки за этот ход сгорают"
      @@scoreInRound = 0
    else
      puts "За этот бросок вы набрали #{@@scoreInRoll} очков и у вас осталось #{player.dices} кубик(ов) для броска"
      puts "В этом ходе вы набрали #{@@scoreInRound}"
    end
    if @@isZonk == false
      if player.dices > 0
        puts "Хотите продолжить свой ход? Введите Д/Н для продолжения или завершения своего хода"
        answer = gets.chomp
        if answer == 'д'|| answer == 'д'.upcase
          whichCombination(player)
        else
          puts "Вы набрали #{@@scoreInRound} очков за свой ход"
        end
      end
    end
  end
  def putsScore(player)
    puts "Общее количество Ваших очков = #{player.score += @@scoreInRound}"
    player.dices = 5
    @@scoreInRound = 0
    puts "---------------------------------------------------------------------------"
  end

end