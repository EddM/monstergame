require 'spec_helper'

describe Attack do

  it "has a type" do
    Growl.type.should == :normal
    Thundershock.type.should == :electric
  end
  
  it "does damage" do
    Kernel.stub!(:rand).and_return(7)
    
    pikachu = Pikachu.new(10)
    charmander = Charmander.new(10)
    thundershock = Thundershock.new
    lambda {
      thundershock.attack!(charmander, pikachu)
    }.should change(charmander, :hp_remaining).by(-44)
  end
  
  it "damages more if the victim is weak to its type" do
    Kernel.stub!(:rand).and_return(7)
      
    magikarp = Magikarp.new(10)
    pikachu = Pikachu.new(10)
    
    thundershock = Thundershock.new
    lambda {
      thundershock.attack!(magikarp, pikachu)
    }.should change(magikarp, :hp_remaining).by(-88)
  end
  
  it "damages less if the victim is resistant to its type" do
    Kernel.stub!(:rand).and_return(7)
    
    pikachu = Pikachu.new(10)
    pikachu2 = Pikachu.new(10)
  
    thundershock = Thundershock.new
    lambda {
      thundershock.attack!(pikachu, pikachu2)
    }.should change(pikachu, :hp_remaining).by(-22)
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

end