class Player
  
  attr_reader :name, :monsters, :stored_monsters
  
  def initialize(name = "Ash", monsters = [])
    @name, @monsters = name, monsters
    @stored_monsters = []
  end
  
  def give_monster(monster)
    if @monsters.size < 6
      @monsters << monster
      @stored_monsters.delete(monster) if @stored_monsters.include?(monster)
    else
      raise NoMonsterSlotsLeftError
    end
  end
  alias :activate_monster :give_monster
  
  def store_monster(monster)
    @stored_monsters << monster
    @monsters.delete(monster) if @monsters.include?(monster)
  end
  
  def swap_monster!(active, stored)
    @monsters[@monsters.index(active)] = stored
    @stored_monsters[stored_monsters.index(stored)] = active
  end
  
end