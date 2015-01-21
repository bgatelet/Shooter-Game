# Class file.

require_relative 'action'

class Player
  attr_accessor :health, :bullets

  def initialize(health, bullets)
    @health = health
    @bullets = bullets
  end

  def game(player, comp)
    puts "Action: "
    ans = gets.chomp
    actionH = player.actionH(ans)
    actionC = comp.actionAI

    puts actionH
    puts actionC

    if actionH == 2 then player.bullets += 1 end
    if actionC == 2 then comp.bullets += 1 end

    if actionH == 0 && player.bullets < 1
      puts "You have no bullets."
    end

    if actionC == 0 && comp.bullets < 1
      puts "Computer tried to shoot, but has no bullets."
    end

    if actionC == 0 && comp.bullets > 0
      puts "Computer shoots."
      case
      when actionH == 0 && player.bullets > 0
        player.health -= 1
        comp.health -= 1
      when actionH == 0 && player.bullets == 0
        player.health -= 1
      when actionH == 2
        player.health -= 1
      end
    elsif actionC == 1 then puts "Computer blocks."
    elsif actionC == 2
      puts "Computer reloads."
      if actionH == 0 && player.bullets > 0
        comp.health -= 1
      end
    end

    if actionC == 0 && comp.bullets > 0 then comp.bullets -= 1 end
    if actionH == 0 && player.bullets > 0 then player.bullets -= 1 end

  end
end

class Human < Player
  include Shootable
  include Blockable
  include Reloadable

  attr_accessor :name

  @@human_population = 0

  def initialize(name = 'anon')
    @name = name
    super(3, 0)
    @@human_population += 1
  end

  def actionH(action)
    if action == 'shoot'
      shoot
    elsif action == 'block'
      block
    elsif action == 'reload'
      reload
    else
      puts "Please type a correct action."
    end
  end
end

class Computer < Player
  attr_accessor :name

  @@computer_population = 0

  def initialize()
    @name = "Computer #{@@computer_population}"
    super(3, 0)
    @@computer_population += 1
  end

  def actionAI
    rand(3)
  end
end
