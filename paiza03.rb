total_human = gets.to_i
company_count = gets.to_i
list = []
company_count.times do
  human, cost = gets.split(' ').map{|v| v.to_i}
  list << {human: human, cost: cost}
end

# total_human = 60
# company_count = 3
# list = [{human: 40, cost: 4300},{human: 30, cost: 2300},{human: 20, cost: 2400}]

class HumanCost
  attr_reader :human, :cost
  def initialize(list)
    @human = 0
    @cost = 0
    list.each do |v|
      @human += v[:human]
      @cost += v[:cost]
    end
  end
end

(1..company_count).each do |combi|
  result = list.combination(combi).to_a.map{|v| HumanCost.new(v)}.
           select{|v| v.human >= total_human}.sort{|a,b| a.cost <=> b.cost}
  if result != []
    puts result[0].cost
    exit
  end
end
