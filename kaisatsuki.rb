class Gate
  attr_accessor :station
  STATIONS = [:shinanjo, :chiryu, :kariya]
  FARES = [150, 200]

  def initialize(station)
    @station = station
  end

  def enter(ticket)
    ticket.stamp(@station)
  end

  def exit(ticket)
    fare = calc_fare(ticket)
    fare <= ticket.money
  end

  def calc_fare(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@station)
    distance = to - from
    FARES[distance.abs - 1]
  end
end

class Ticket
  attr_reader :money, :stamped_at
  def initialize(money)
    @money = money
  end

  def stamp(name)
    @stamped_at = name
  end
end

shinanjo = Gate.new(:shinanjo)
chiryu = Gate.new(:chiryu)
kariya = Gate.new(:kariya)
ticket = Ticket.new(150)

puts "どこの駅から電車に乗りますか？"
print <<"EOS"
  1. 新安城
  2. 知立
  3. 刈谷
  数字で選択してください。
EOS

number_start = gets()
if number_start.to_i == 1
  puts "新安城"
  shinanjo.enter(ticket)
elsif number_start.to_i == 2
  puts "知立"
  chiryu.enter(ticket)
elsif number_start.to_i == 3
  puts "刈谷"
  kariya.enter(ticket)
else
  puts "正しい数字を入力してください。"
  return
end
puts ""
puts "どこの駅で降りますか？"
print <<"EOS"
  1. 新安城
  2. 知立
  3. 刈谷
  数字で選択してください。
EOS
number_end = gets()
if number_start == number_end
  puts "正しい駅を選択してください"
  return
elsif number_end.to_i == 1
  puts "新安城"
  puts shinanjo.exit(ticket) == true ? "料金は#{ticket.money}円です" : "料金は200円です"
elsif number_end.to_i == 2
  puts "知立"
  puts chiryu.exit(ticket) == true ? "料金は#{ticket.money}円です" : "料金は200円です"
elsif number_end.to_i == 3
  puts "刈谷"
  puts kariya.exit(ticket) == true ? "料金は#{ticket.money}円です" : "料金は200円です"
else
  puts "正しい数字を入力してください。"
  return
end
