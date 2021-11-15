require_relative 'train'

class CargoTrain < Train

  attr_reader :type

  def type
    @type = 'cargo'
  end

end