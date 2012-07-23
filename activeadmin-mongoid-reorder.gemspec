# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |gem|
  gem.name    = 'activeadmin-mongoid-reorder'
  gem.version = '0.1.0'
  gem.summary = 'Reordarable rows in activeadmin index table view.'
  gem.description = ''
  gem.license = 'MIT'

  gem.authors  = ['Alex Kravets']
  gem.email    = 'santyor@gmail.com'
  gem.homepage = 'https://github.com/alexkravets/activeadmin-mongoid-reorder'

  gem.files         = Dir[ "lib/**/*" ]
  gem.require_paths = ['lib']

  # Supress the warning about no rubyforge project
  gem.rubyforge_project = 'nowarning'
end
