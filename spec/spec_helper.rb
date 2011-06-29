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
require "lib/attacks/mega_punch"
require "lib/attacks/tackle"
require "lib/attacks/defense_curl"
require "lib/attacks/poison_sting"

require "lib/monsters/pikachu"
require "lib/monsters/charmander"
require "lib/monsters/magikarp"
require "lib/monsters/geodude"
require "lib/monsters/weedle"

require "lib/exceptions/attack_not_available_error"