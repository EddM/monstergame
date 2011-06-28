require 'spec_helper'

describe Monster do
  
  it "sets max hp" do
    monster = Monster.new(1)
    monster.max_hp.should == 100
    
    monster_level2 = Monster.new(2)
    monster_level2.max_hp.should == 150
    
    monster_level5 = Monster.new(5)
    monster_level5.max_hp.should == 375
    
    monster_level27 = Monster.new(27)
    monster_level27.max_hp.should == 2025
  end
  
  it "sets max hp based on a given base hp" do
    monster = Monster.new(3, 250)
    monster.max_hp.should == 562
  end
  
  it "spawns alive with max hp" do
    monster = Monster.new(3)
    monster.hp_remaining.should == 225
    monster.max_hp.should == 225
    monster.should be_alive
  end
  
  it "takes damage" do
    monster = Monster.new(5)
    lambda {
      monster.remove_hp!(200)
    }.should change(monster, :hp_remaining).by(-200)
    monster.should be_alive
  end
  
  it "takes healing" do
    monster = Monster.new(5)
    monster.remove_hp!(250)
    lambda {
      monster.heal!(100)
    }.should change(monster, :hp_remaining).by(100)
    monster.should be_alive
  end
  
  it "dies when it runs out of HP" do
    monster = Monster.new(5)
    monster.remove_hp!(150)
    monster.remove_hp!(100)
    monster.should be_alive
    monster.remove_hp!(150)
    monster.should be_dead
  end
  
  # uses the Gen I type chart: http://bulbapedia.bulbagarden.net/wiki/Type_chart
  
  it "can be elementless (normal)" do
    monster = Monster.new
    monster.type.should == :normal
  end
  
  it "can be of an element" do
    electric_monster = ElectricMonster.new
    electric_monster.type.should == :electric
  end
  
  it "has weaknesses" do
    electric_monster = ElectricMonster.new
    electric_monster.should be_weak_to(:ground)
    electric_monster.should_not be_weak_to(:flying)
    electric_monster.should_not be_weak_to(:fire)
  end
  
  it "has resistances" do
    electric_monster = ElectricMonster.new
    electric_monster.should be_resistant_to(:flying)
    electric_monster.should_not be_resistant_to(:ground)
    electric_monster.should_not be_resistant_to(:water)
  end
  
  it "takes no extra or less damage when attacked by a type it is neither resistant to nor weak to" do
    Kernel.stub!(:rand).and_return(7)
    
    electric_monster = ElectricMonster.new(25)
    lambda {
      electric_monster.damage!(100, :grass)
    }.should change(electric_monster, :hp_remaining).by(-57)
  end
  
  it "takes more damage when attacked against weakness" do
    Kernel.stub!(:rand).and_return(7)
    
    electric_monster = ElectricMonster.new(25)
    lambda {
      electric_monster.damage!(100, :ground)
    }.should change(electric_monster, :hp_remaining).by(-114)
  end
  
  it "takes less damage when attacked by a type it resists" do
    Kernel.stub!(:rand).and_return(7)
    
    electric_monster = ElectricMonster.new(25)
    lambda {
      electric_monster.damage!(100, :flying)
    }.should change(electric_monster, :hp_remaining).by(-28)
  end
  
  it "has attacks" do
    pikachu = Pikachu.new
    pikachu.attacks.should include(Growl)
    pikachu.attacks.should include(Thundershock)
    pikachu.attacks.should include({ 6 => TailWhip })
    pikachu.attacks.should_not include(WaterGun)
  end
  
  it "has attacks restricted to levels" do
    pikachu = Pikachu.new(2)
    pikachu.available_attacks.should include(Growl)
    pikachu.available_attacks.should include(Thundershock)
    pikachu.available_attacks.should_not include({ 6 => TailWhip })

    pikachu = Pikachu.new(8)
    pikachu.available_attacks.should include(Growl)
    pikachu.available_attacks.should include(Thundershock)
    pikachu.available_attacks.should include({ 6 => TailWhip })
  end
  
end