module Girlfriend
  module Ability
    class Finger < Girlfriend::Ability::Base
      def finger(input)
		output  = "I am #{girl.name}, a #{girl.age} years old girl from #{girl.hometown} currently attending #{girl.school}.\n\n"
		output += "When not studying, I love #{girl.hobbies.join(", ")} and talking to dudes just like YOU."
		output
      end
    end
  end
end
