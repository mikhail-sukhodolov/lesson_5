require_relative 'wagon'

class PassWagon < Wagon

  attr_reader :type
  
  def initialize(wagon_number)
    super
    @type = 'passenger'
  end

end