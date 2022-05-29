class Spell

  attr_reader :name, :spell

  def initialize(name, spell)
    @name = name
    @spell = spell
  end

  def to_s
    spell = ''
    spell += "#{@name}[#{@spell}]"
    spell
  end

  def attack(monster)
    if monster.status[:name] == "burnt"
      monster.status[:turn_remaining] += 1
      puts "casts #{@name} spell on enemy's #{monster.name}"
    end
  end
  
  
end