require_relative 'monster'

class FireMonster < Monster
  def initialize(name, hitpoint, attack_point)
    super(name, hitpoint, attack_point)
    @elemental_attack = {
      initial_damage: 0,
      effect: 'burnt',
      turn: 3,
      over_time_damage: 0.4 * @attack_point
    }
  end
  
  def attack(monster)
    unless @status[:name] == 'frozen'
      monster.take_elemental_attack(@elemental_attack)
      take_damage(0.5 * monster.attack_point)
  
      puts "#{@name} uses elemental attack on enemy's #{monster.name}, deals #{@elemental_attack[:initial_damage]} damage, takes #{0.5 * monster.attack_point} damage, inflict #{@elemental_attack[:effect]} status for #{@elemental_attack[:turn]} turns with #{@elemental_attack[:over_time_damage]} damage each turn"
    else
      puts "#{@name} is in frozen state, can't attack"
    end
  end
end
