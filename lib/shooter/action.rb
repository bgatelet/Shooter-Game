# Block for deciphering user input.
# User input can only be shoot, block, or reload. Because of the .downcase, case doesn't matter.

module Action
  def action(action)
    loop do
      if action == 'shoot' then return 0
      elsif action == 'block' then return 1
      elsif action == 'reload' then return 2
      else
        puts "Please type a correct action: "
        action = gets.chomp.downcase
      end
    end
  end
end
