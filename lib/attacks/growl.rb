class Growl < Attack
  
  def attack!(victim, attacker)
    victim.debuff!(:attack, 1)
  end
  
end