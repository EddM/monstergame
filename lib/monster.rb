# Generic class -- do not instantiate directly

class Monster
  
  @@attacks = []
  
  TYPES = %w(fighting flying poison ground rock bug ghost fire water grass electric psychic ice dragon)
  
  attr_reader :type, :weaknesses, :resistances
  attr_reader :level, :max_hp, :hp_remaining, :alive, :attack, :defence
  
  def initialize(level = 1, base_hp = 100)
    @level = level
    @hp_remaining = @max_hp = (base_hp * (level > 1 ? (level * 0.75) : level)).to_i
    
    @type = :normal
    @weaknesses, @resistances = [], []
    @alive = true
    
    @attack = 10
    @defence = 4
  end
  
  def heal!(amount)
    if (@hp_remaining + amount) < @max_hp
      @hp_remaining += amount
    else
      @hp_remaining = @max_hp
    end
  end
  
  def damage!(amount, type = :normal, attacker = nil)
    stab = attacker && type == attacker.type ? 1.5 : 1
    crit = 1
    type = weak_to?(type) ? 2 : (resistant_to?(type) ? 0.5 : 1)
    modifier = (stab * type * crit * 1) * ((85 + Kernel.rand(15)) / 100.0)

    level = (2 * (attacker ? attacker.level : @level) + 10) / 250.0
    differential = attacker ? attacker.attack / @defence.to_f : @attack / @defence.to_f
    
    amount = (level * differential * amount + 2) * modifier
    amount = amount < 1 ? 1 : amount.floor
    remove_hp!(amount)
  end
  
  def remove_hp!(amount)
    if (@hp_remaining - amount) <= 0
      @hp_remaining = 0 and die!
    else
      @hp_remaining -= amount
    end
  end
  
  def die!
    @alive = false
  end
  
  def alive?
    @alive
  end
  
  def dead?
    !@alive
  end
  
  def weak_to?(type)
    @weaknesses.include?(type.to_sym)
  end
  
  def resistant_to?(type)
    @resistances.include?(type.to_sym)
  end
  
  def attacks
    @@attacks
  end
  
  def available_attacks
    @@attacks.select { |a| a.class == Class || a.keys.first <= @level }
  end
  
  private
  
  def self.attack(attack, level = nil)
    @@attacks.push(level ? { level => attack } : attack)
  end
  
end