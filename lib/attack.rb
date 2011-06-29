class Attack
  # => http://bulbapedia.bulbagarden.net/wiki/Damage_modification
  
  def initialize(attacker)
    @attacker = attacker
  end
  
  def attack!(victim)
    raise "Attack not implemented"
  end
  
  def type
    @type ||= self.class.type
  end
  
  def damage!(victim, amount)
    victim.damage!(amount, self.type, @attacker, crit? ? 2 : 1)
  end
  
  def crit?
    Random.critical(@attacker.speed / self.class.crit_chance.to_f)
  end
  
  def self.crit_chance
    @crit_chance ||= 255
  end
  
  def self.crit_chance=(val)
    @crit_chance = value
  end
  
  def self.type
    :normal
  end
  
  private
  
  def self.high_crit_chance
    @crit_chance = 64
  end
  
end