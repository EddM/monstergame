class Attack
  # => http://bulbapedia.bulbagarden.net/wiki/Damage_modification
  
  def attack!(victim, attacker)
    raise "Attack not implemented"
  end
  
  def type
    @type ||= self.class.type
  end
  
  def damage!(victim, attacker, amount)
    victim.damage!(amount, self.type, attacker)
  end
  
  def self.type
    :normal
  end
  
end