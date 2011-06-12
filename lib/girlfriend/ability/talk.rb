module Girlfriend
  module Ability
    class Talk < Girlfriend::Ability::Base
      def talk(input)
      	return girl.reply if input.empty?
        Eliza.interact?(input)
      end
    end
  end
end
