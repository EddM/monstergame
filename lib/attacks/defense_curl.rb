class DefenseCurl < Attack
  
  def attack!(victim)
    @attacker.buff!(:defence, 1)
  end
  
end