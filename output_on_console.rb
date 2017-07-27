
class OutputOnConsole
  def enterNumberOfPlayers
    puts 'Введите количество игроков, минимум 2'
  end
  def enterNamePlayer (numberOfPlayer)
    numberOfPlayer.times do |s|
      puts "Введите имя игрока #{s + 1}"
      input = InputParameter.new
      input.enterPlayerName
    end
  end
  def resultRollOfDice (res, name)
    print "У #{name} выпало: "
    print res; puts
  end
  def rollDice
    puts "Нажмите Enter что бы бросить кости"
    gets
  end
end