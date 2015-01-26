# Class file for game players.

require_relative 'action'
require_relative 'level'
require_relative 'play'
require_relative 'high_score'

# Main player class for health and bullets.
class Player
  include Play
  include HighScore

  attr_accessor :health, :bullets

  def initialize()
    @health = 3
    @bullets = 0
  end
end

# Human player class for name.
class Human < Player
  include Action
  include Level

  attr_accessor :name

  @@human_population = 0

  def initialize(name = 'anon')
    @name = name
    super()
    @@human_population += 1
  end
end

# AI class.
class Computer < Player
  attr_accessor :name

  @@computer_population = 0

  def initialize()
    @name = "Robot #{@@computer_population + 1}"
    super()
    @@computer_population += 1
  end

  # Random number between 0..2 is generated to decide what action the AI will take.
  def actionAI
    rand(3)
  end

  def population
    return @@computer_population
  end
end
