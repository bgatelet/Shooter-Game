# Difficulty level of easy, medium, or hard based on player input at the beginning of the game.

module Level
  def level
    loop do
      puts "What difficulty would you like?(easy, medium, hard)"
      answer = gets.chomp.downcase

      if answer == 'easy'
        self.health = 4
        self.bullets = 1
        break
      elsif answer == 'medium'
        self.health = 3
        self.bullets = 0
        break
      elsif answer == 'hard'
        self.health = 1
        self.bullets = 1
        break
      else
        puts "Please write a correct difficulty."
      end
    end
  end
end
