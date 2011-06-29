class PoisonSting < Attack
  
  def attack!(victim)
    victim.poison!(5)
  end
  
end