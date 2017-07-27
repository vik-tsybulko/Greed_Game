class CalculationOfResult
  def winner(players)
    @scores = {}
    players.each do |player|
    @scores[player] = player.score
    end

    max = @scores.max_by{|key, value| value}
    puts "Выигрывает #{max.first.name} у него #{max.first.score} очков"
    puts "___________________________________________________________________________"
    puts "Итоговая таблица результатов"
    i = 1
    puts "-----------------------"
    printf "|%-2s|%-12s|%-5s|", "#", "name", "score"; puts
    puts "-----------------------"
    @scores.each do |key, value|
      printf "|%-2s|%-12s|%-5s|", i, key.name, value; puts
      i += 1
    end

  end
end