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
      
    magicarp = Magicarp.new(10)
    pikachu = Pikachu.new(10)
    
    thundershock = Thundershock.new
    lambda {
      thundershock.attack!(magicarp, pikachu)
    }.should change(magicarp, :hp_remaining).by(-88)
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

end