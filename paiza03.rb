total_human = gets.to_i
company_count = gets.to_i
list = []
company_count.times do
  human, cost = gets.split(' ').map{|v| v.to_i}
  list << {human: human, cost: cost}
end

class HumanCost

  attr_reader :human, :cost, :error

  def initialize(list)
    @human = 0
    @cost = 0
    @error = false
    list.each do |v|
      @human += v[:human]
      if @human > 200_000
        error = true
        break
      end
      @cost += v[:cost]
      if @cost > 5_000_000
        error = true
        break
      end
    end
  end
end

(1..company_count).each do |combi|
  result = list.combination(combi).map { |v| HumanCost.new(v) }.
           select { |v| v.error == false }.
           select { |v| v.human >= total_human }.sort { |a,b| a.cost <=> b.cost}
  if result != []
    puts result[0].cost
    exit
  end
end
