module Girlfriend
  module Ability
    class Base
	    attr_reader :girl
		  	
		  def initialize(girl)
			  @girl = girl
		  end
			
		  def try?(method, input)
			  send(method, input) if respond_to? method
		  end
    end
  end
end
