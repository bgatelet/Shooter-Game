# Action modules.

module Shootable
  def shoot
    return 0
  end
end

module Blockable
  def block
    return 1
  end
end

module Reloadable
  def reload
    return 2
  end
end
