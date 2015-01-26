# Save and load highscores from 'high_score.csv'.

module HighScore

  # Save the player's score after the game has ended.
  def saveable(score, level, name)

    # Prepend's a 0 if the score is below 10.
    if score < 10
      finals = "0#{score.to_s}"
    else
      finals = score
    end

    File.open("high_score.csv", "a") do |file|
      file.puts "#{finals},#{level},#{name}"
    end
  end

  def loadable(high_score)

    # Maintain a list of only the 10 best scores irrespective of the level played.
    def selective(arr)
      if arr.length > 10
        arr.pop
        selective(arr)
      end
    end

    # Sort the high scores before displaying them.
    arr = File.readlines(high_score).sort.reverse
    selective(arr)

    File.open(high_score,"w") do |file|
      file.puts arr
    end

    # Prints out each high score after being sorted.
    slot = 1
    File.readlines(high_score).each do |line|
      score, level, name = line.split(',')
      puts "#{slot}. #{name} has defeated #{score} robot(s) on #{level} mode."
      slot += 1
    end
  end
end
