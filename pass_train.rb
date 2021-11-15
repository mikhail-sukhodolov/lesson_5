require_relative 'train'

class PassTrain < Train

  attr_reader :type

  def type
    @type = 'passenger'
  end

end