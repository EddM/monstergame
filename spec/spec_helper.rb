require 'rspec'
require 'spec/mocks'

require 'lib/monster.rb'

Monster::TYPES.each do |type|
  require "lib/monsters/types/#{type}_monster"
end

require "lib/attack"
require "lib/attacks/types/electric_attack"
require "lib/attacks/growl"
require "lib/attacks/thundershock"
require "lib/attacks/tail_whip"
require "lib/attacks/water_gun"

require "lib/monsters/pikachu"
require "lib/monsters/charmander"
require "lib/monsters/magicarp"