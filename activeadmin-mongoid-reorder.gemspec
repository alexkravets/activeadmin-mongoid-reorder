# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |gem|
  gem.name    = 'activeadmin-mongoid-reorder'
  gem.version = '0.2.0'
  gem.summary = 'Reorder index table rows plugin for activeadmin.'
  gem.description = ''
  gem.license = 'MIT'

  gem.authors  = ['Alex Kravets']
  gem.email    = 'santyor@gmail.com'
  gem.homepage = 'https://github.com/alexkravets/activeadmin-mongoid-reorder'

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  # Supress the warning about no rubyforge project
  gem.rubyforge_project = 'nowarning'
end
