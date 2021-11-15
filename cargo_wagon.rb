require_relative 'wagon'

class CargoWagon < Wagon

  attr_reader :type
  
  def initialize(wagon_number)
  super
  @type = 'cargo'
  end

end