Kernel.load './lib/girlfriend/version.rb'

Gem::Specification.new 'girlfriend', Girlfriend::VERSION do |s|
  s.rubyforge_project = 'girlfriend'
  s.authors           = ['Mihail Szabolcs']
  s.email             = ['szaby@szabster.net']
  s.description       = 'Girlfriend is an installable, upgradable and removeable girlfriend'
  s.homepage          = 'http://github.com/icebreaker/girlfriend'
  s.require_paths     = ['lib']
  s.files             = Dir.glob('lib/**/*') + %w(README.md LICENSE)
  s.test_files        = Dir.glob('test/**/*')
  s.executables       = ['girlfriend']
  s.summary           = 'Having an installable, upgradable and removable girlfriend has never been so easy!'
end
