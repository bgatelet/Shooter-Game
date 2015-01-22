# Game mechanics.

module Play
  def play(player, comp)
    # Gather the player actions. 0 for shoot, 1 for block, 2 for reload.
    puts "Action: "
    ans = gets.chomp.downcase
    actionH = player.action(ans)
    actionC = comp.actionAI

    # Cannot shoot without bullets.
    if actionH == 0 && player.bullets < 1
    puts "You have no bullets."
    end

    # Making sure the AI takes damage even if it tries to shoot without ammo.
    if actionC == 0 && comp.bullets < 1
      puts "Computer tried to shoot, but has no bullets."
      if actionH == 0 && player.bullets > 0 then comp.health -= 1 end
    end

    # All remaining possible scenarios from shooting with bullets to blocking and reloading.
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
      if actionH == 0 && player.bullets > 0 then comp.health -= 1 end
    end

    # Making sure the players use a bullet after shooting.
    if actionC == 0 && comp.bullets > 0 then comp.bullets -= 1 end
    if actionH == 0 && player.bullets > 0 then player.bullets -= 1 end

    # Adding a bullet for the reload.
    if actionH == 2 then player.bullets += 1 end
    if actionC == 2 then comp.bullets += 1 end

    # Tie breaker results in single-life deathmatch.
    if player.health == 0 && comp.health == 0
      puts "Sudden death."
      player.health = 1
      player.bullets = 0
      comp.health = 1
      comp.bullets = 0
    end
  end
end
