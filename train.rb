require_relative 'station'
require_relative 'route'

class Train

# имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса, может набирать скорость и возвращать текущую скорость, может возвращать количество вагонов
  attr_accessor :speed, :station, :route, :wagons
  attr_reader :type


  def initialize(train_number)
    @train_number = train_number
    @wagons = []
    @speed = 0
  end

# может тормозить (сбрасывать скорость до нуля)
  def stop
    self.speed = 0
  end

  def train_number
    @train_number
  end

# может принимать маршрут следования (объект класса Route), при назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
  def add_route(route)
    @route = route
    self.station = route.station_list.first
    self.station.get_train(self)
  end
    
# может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз, возвращать предыдущую станцию, текущую, следующую, на основе маршрута
  def next_station
    self.route.station_list[route.station_list.index(self.station) + 1]
  end

  def prev_station
    self.route.station_list[route.station_list.index(self.station) - 1]
  end

  def cur_station
    self.route.station_list[route.station_list.index(self.station)]
  end

  def move_forward
    self.station.departure(self)
    self.station = next_station if cur_station != route.station_list.last
    self.station.get_train(self)
  end

  def move_back
    self.station.departure(self)
    self.station = prev_station if cur_station != route.station_list.first
    self.station.get_train(self)
  end
  
  def add_wagon(wagon)
    @wagons << wagon
  end

end   
