class Growl < Attack
  
  def attack!(victim)
    victim.debuff!(:attack, 1)
  end
  
end