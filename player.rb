require_relative "spell_card"

class Player
  attr_reader :monsters
  attr_reader :spell

  def initialize(name)
    @name = name
    @monsters = []
    @spell = []
  end

  def add_monster(monster)
    monsters << monster.dup
  end

  def add_spell(spel)
    spell << spel
  end

  def to_s
    result = "#{@name}:\n"

    @monsters.each_with_index do |monster, index|
      result += monster.to_s
      if index < @monsters.size - 1
        result += ', ' 
      else
        @spell.each do |spel|
          result += ', '
          result += spel.to_s
         end
        result += "\n"
      end
    end
    
    result
  end

  def play_turn(own_card, opponent_card, opponent)
    
    if @monsters[own_card-1].respond_to?("attack")
      print "#{@name}'s "
      @monsters[own_card-1].attack(opponent.monsters[opponent_card-1])
      
    elsif @spell[own_card-1].respond_to?("attack")
      @spell[own_card-1].attack(opponent.monsters[opponent_card-1])
      
    end
  end

  def apply_effects
    @monsters.each do |monster|
      monster.apply_effect
    end
  end
end
