class DefenseCurl < Attack
  
  def attack!(victim, attacker)
    attacker.buff!(:defence, 1)
  end
  
end