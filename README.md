Girlfriend
==========
Having an installable, upgradable and removable girlfriend has never been so easy!

You've come to the right place at the right time, look no further and get started
right away.

Getting Started with your Girlfriend
------------------------------------
In order to `install` your girlfriend open a terminal window and type:
	
	gem install girlfriend

If you want to `upgrade` your girlfriend to a later version type:

	gem update girlfriend

Finally, to `remove` your girlfriend you have to type:

	gem remove girlfriend

Pretty straightforward isn't it?

Interacting with your Girlfriend
--------------------------------
Once you have your girlfriend `installed` open a terminal window and type:

	girlfriend --ability interactive

This will take you in `interactive mode` where you can start `talking` at once.

Teach and tweak your Girlfriend
-------------------------------
Most probably, you don't want your girlfriend to be just like anybody else's girlfriend, fear
not because this is easier than you might think.

Create a file named `~/.girlfriend/config.rb` and open it in your favorite text editor:

	Girlfriend.configure do |config|
		config.name = 'Valeria'
		config.age = 23
		config.hometown = 'Moscow, Russia'
		config.school = 'Russian Academy of Economics'
		config.hobbies = ['gaming','travelling','photography']
	end

Be sure to `finger` her afterwards to see the results via `girlfriend --ability finger` .

By default your girlfriend has two abilities 'finger' and 'talk', you can always list
all her abilities via `girlfriend --abilities`.

Adding her a new ability is just as easy as configuring her and can be done by dropping a new
file let's say `~/.girlfriend/eat.rb`:

	module Girlfriend                                                                                                         
		module Ability
			class Eat < Base
				def eat(input)
					if input =~ /pizza/i
						'I love pizza!'
					elif input =~ /banana/i
						'Uh-oh, yummy!!! Hehe!'
					else
						'Dude, I don\'t like that! Yuck!'
					end
				end
			end
		end
	end
	
	Girlfriend.register_ability :eat do |girl|
		Girlfriend::Ability::Eat.new(girl)
	end

Be sure to check out her list of abilities `girlfriend --abilities` in order to confirm 
that she acknowledged her new ability.

Your girlfriend's current version number can be verified by `girlfriend --version`.

Contribute
----------
* Fork the project.
* Make your feature addition or bug fix.
* Send me a pull request. Bonus points for topic branches.
* Do **not** bump the version number.

License
-------
Copyright (c) 2011, Mihail Szabolcs

Girlfriend is provided **as-is** under the **MIT** license. For more information see LICENSE.

Credits
-------
* [paipr](https://github.com/olabini/paipr)
