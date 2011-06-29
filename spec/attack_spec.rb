require 'spec_helper'

describe Attack do

  it "has a type" do
    Growl.type.should == :normal
    Thundershock.type.should == :electric
  end
  
  it "does damage" do
    Random.stub!(:damage_modifier).and_return(7)
    Random.stub!(:critical).and_return(false)
    
    pikachu = Pikachu.new(10)
    charmander = Charmander.new(10)
    thundershock = Thundershock.new(pikachu)
    lambda {
      thundershock.attack!(charmander)
    }.should change(charmander, :hp_remaining).by(-44)
  end
  
  it "damages more if the victim is weak to its type" do
    Random.stub!(:damage_modifier).and_return(7)
    Random.stub!(:critical).and_return(false)
    
    magikarp = Magikarp.new(10)
    pikachu = Pikachu.new(10)
    
    thundershock = Thundershock.new(pikachu)
    lambda {
      thundershock.attack!(magikarp)
    }.should change(magikarp, :hp_remaining).by(-88)
  end
  
  it "damages less if the victim is resistant to its type" do
    Random.stub!(:damage_modifier).and_return(7)
    Random.stub!(:critical).and_return(false)
    
    pikachu = Pikachu.new(10)
    pikachu2 = Pikachu.new(10)
  
    thundershock = Thundershock.new(pikachu)
    lambda {
      thundershock.attack!(pikachu2)
    }.should change(pikachu2, :hp_remaining).by(-22)
  end
  
  it "can provide stat buffs" do
    geodude = Geodude.new(13)
    geodude.available_attacks.should include(DefenseCurl)
    lambda {
      geodude.attack!(DefenseCurl, nil)
    }.should change(geodude, :defence).by(1)
  end
  
  it "can inflict stat debuffs" do
    pikachu = Pikachu.new(5)
    charmander = Charmander.new(5)
    lambda {
      pikachu.attack!(Growl, charmander)
    }.should change(charmander, :attack).by(-1)
  end
  
  it "can poison victims" do
    magikarp = Magikarp.new(10)
    weedle = Weedle.new(10)
    weedle.attack!(PoisonSting, magikarp)
    magikarp.should be_poisoned
    lambda { magikarp.tick! }.should change(magikarp, :hp_remaining).by_at_most(-1)
    lambda { magikarp.tick! }.should change(magikarp, :hp_remaining).by_at_most(-1)
    lambda { magikarp.tick! }.should change(magikarp, :hp_remaining).by_at_most(-1)
  end
  
  it "can critically hit" do
    Random.stub!(:damage_modifier).and_return(7)
    
    charmander = Charmander.new(25)
    pikachu = Pikachu.new(10)
    
    Random.stub!(:critical).and_return(false)
    non_critical_damage = pikachu.attack!(Thundershock, charmander)
    Random.stub!(:critical).and_return(1)
    critical_damage = pikachu.attack!(Thundershock, charmander)
    critical_damage.should be > non_critical_damage
  end

end