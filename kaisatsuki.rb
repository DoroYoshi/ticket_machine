class Gate
  attr_accessor :
  STATIONS = [:shinanjo, :kariya, :chiryu]
  FARES = [150, 190]

  def initialize(station)
    @station = station
  end

  def enter(ticket)
    ticket.stamp(@station)
  end

  def exit(ticket)
    fare = calc_fare(ticket)
    faare <= ticket.fare
  end

  def calc_fare(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@station)
    distance = to - from
    FARES[distance - 1]
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

ticket = Ticket.new(150)
shinanjo.enter(ticket)
chiryu.exit(ticket)

ticket = Ticket.new(190)
shinanjo.enter(ticket)
chiryu.exit(ticket)