class Station

# имеет название, которое указывается при ее создании
# может возвращать список всех поездов на станции, находящиеся в текущий момент
  attr_accessor :trains

  def initialize (station_name)
    @station_name = station_name
    @trains = []
  end

  def station_name
    @station_name
  end

# может принимать поезда (по одному за раз)
  def get_train(train)
    @trains << train
  end

# может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
  def departure(train)
    @trains.delete(train)
  end

# может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
  def get_type(type)
    @trains.select {|train| train.type == type}            
  end

end