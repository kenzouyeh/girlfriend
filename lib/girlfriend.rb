require 'girlfriend/eliza/pat2'
require 'girlfriend/eliza/pat3'
require 'girlfriend/eliza/pat4'
require 'girlfriend/eliza/pat5'
require 'girlfriend/eliza/eliza'
require 'girlfriend/version'
require 'girlfriend/ability/base'
require 'girlfriend/ability/finger'
require 'girlfriend/ability/talk'

module Girlfriend
	class GirlfriendError < StandardError; end
	class << self
		attr_accessor :name, :age, :hometown, :school, :hobbies, :reply
		
		#
		# Configure Girlfriend to suit your needs
		#
		#	Girlfriend.configure do |config|
		#		config.name = 'Ruby'
		# 	end
		#
		#	Configurables:
		#
		#	[name = String] 	Girlfriend's name
		#	[age = Integer]		Girlfriend's age
		# 	[hometown = String] Girlfriend's hometown
		# 	[school = String] 	Girlfriend's school
		# 	[hobbies = Array]	Girlfriend's hobbies
		# 	[reply = String]	Girlfriend's default reply text
		#
		def configure
			yield self
		end
		
		#
		# Returns an empty or existing array of abilities
		#
		def abilities
			@abilities ||= {}
		end
		
		#
		# Registers a new Girlfriend ability
		#
		# 	Girlfriend.register_ability :talk do |girl|
		# 		Girlfriend::Ability::Talk.new(girl)
		# 	end
		#
		def register_ability(name, &block)
			abilities[name] = block
		end
			
		#
		# Returns TRUE if the given ability exists, otherwise FALSE
		#
		def can?(name)
			abilities.include? name
		end
				
		#
		# Interact with Girlfriend
		#
		# name - name of an ability 
		# input - text input (default: '')
		#
		# if name is :interactive then it enters interactive mode, otherwise
		# executes and returns immediately
		#
		# Returns the result of the interaction.
		#
		def interact?(name, input='')
			if name == :interactive
				interactive(input)
			else
				if can? name
					ability = abilities[name].call(self)
					ability.try? name, input
				else
					reply
				end
			end
		end
		
		protected
		
		#
		# Internal helper for interactive mode
		#
		# input - text input
		#
		def interactive(input)
			puts 'Say hi to ' + name + ' now or type `leave` to stop talking to her!'

			while true
				print 'Dude > '
				input = gets.chomp
		
				if input == 'leave'
					break
				else
					puts name + ' > ' + interact?(:talk, input)
				end
			end
			
			name + ' > Bye dude ...'
		end
	end
end

Girlfriend.configure do |config|
	config.name = 'Ruby'
	config.age = 21
	config.hometown = 'New York'
	config.school = 'Florida State University'
	config.hobbies = ['gaming','cooking','photography','blogging']
	config.reply = 'LOL Z DUDE YOU MAD?'
end

Girlfriend.register_ability :finger do |girl|
	Girlfriend::Ability::Finger.new(girl)
end

Girlfriend.register_ability :talk do |girl|
	Girlfriend::Ability::Talk.new(girl)
end
