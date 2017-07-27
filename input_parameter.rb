class InputParameter
  def initialize
    @@continuee = true
  end
  attr_reader :continuee
  $users = []
  @nameUser
  def enterCountUsers
    @countUsers = gets.chomp.to_i
    # @countUsers = 1 #zahlushka
  end
  def enterPlayerName
    name = gets.chomp
    # name = "q" #zahlushka
    user = Player.new
    user.name = name
    $users << user
  end
  def iscontinue
    puts "Хотите продолжить играть Д/Н?"
    answer = gets.chomp
    @@continuee = (answer == "д" || answer == "д".upcase) ? true : false
  end

end