require 'spec_helper'

describe Player do
  
  it "has a name" do
    player = Player.new("Ash")
    player.name.should == "Ash"
  end
  
  it "can have can have monsters" do
    player = Player.new("Ash")
    player.give_monster Pikachu.new(15)
    player.give_monster Charmander.new(15)
    player.give_monster Geodude.new(15)
    player.give_monster Weedle.new(15)
    
    player.monsters.size.should == 4
  end
  
  it "can have can have more than one of the same type of monster" do
    player = Player.new("Ash")
    pikachu1 = Pikachu.new(10)
    pikachu2 = Pikachu.new(8)
    magikarp = Magikarp.new(3)
  
    player.give_monster pikachu1
    player.give_monster magikarp
    player.give_monster pikachu2
  
    player.monsters.size.should == 3
    player.monsters.should include(pikachu1)
    player.monsters.should include(pikachu2)
  end
  
  it "can only have six active monsters" do
    player = Player.new("Ash")
    player.give_monster Pikachu.new(15)
    player.give_monster Charmander.new(15)
    player.give_monster Geodude.new(15)
    player.give_monster Weedle.new(15)
    player.give_monster Geodude.new(15)
    player.give_monster Weedle.new(15)
    
    player.monsters.size.should == 6
    lambda {
      player.give_monster Pikachu.new(20)
    }.should raise_error(NoMonsterSlotsLeftError)
    player.monsters.size.should == 6
  end
  
  it "can store monsters elsewhere" do
    player = Player.new("Ash")
    pikachu = Pikachu.new(23)
    player.store_monster pikachu
    
    player.monsters.should_not include(pikachu)
    player.stored_monsters.size.should == 1
    player.stored_monsters.should include(pikachu)
  end
  
  it "can store monsters that are currently active" do
    player = Player.new("Ash")
    pikachu = Pikachu.new(20)
    player.give_monster pikachu
    player.give_monster Charmander.new(15)
    player.give_monster Geodude.new(15)
    
    player.store_monster pikachu
    player.monsters.should_not include(pikachu)
    player.stored_monsters.should include(pikachu)
  end
  
  it "can activate stored monsters" do
    player = Player.new("Ash")
    pikachu = Pikachu.new(20)
    player.give_monster Charmander.new(15)
    player.give_monster Geodude.new(15)
    player.store_monster pikachu
    
    player.stored_monsters.should include(pikachu)
    player.monsters.should_not include(pikachu)
    player.give_monster pikachu
    player.monsters.should include(pikachu)
    player.stored_monsters.should_not include(pikachu)
  end
  
  it "can swap stored monsters with active monsters" do
    charmander = Charmander.new(12)
    player = Player.new("Ash", [charmander, Pikachu.new(15), Geodude.new(15), Weedle.new(15), Geodude.new(15), Weedle.new(15)])
    another_pikachu = Pikachu.new(23)
    player.store_monster another_pikachu
    
    player.monsters.should_not include(another_pikachu)
    player.stored_monsters.should_not include(charmander)
    
    player.swap_monster!(charmander, another_pikachu)
    
    player.monsters.should include(another_pikachu)
    player.stored_monsters.should include(charmander) 
  end
  
end