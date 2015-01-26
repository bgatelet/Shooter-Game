Gem::Specification.new do |s|
  s.name                  = "shooter"
  s.version               = "2.0.0"
  s.author                = "Brice Gatelet"
  s.email                 = "bgatelet@gmail.com"
  s.summary               = "A console game based off of the hand game shooter, aka shotgun."
  s.description           = File.read(File.join(File.dirname(__FILE__), 'README.md'))
  s.homepage              = "https://github.com/bgatelet/Shooter-Game"

  s.files                 = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE.md README.md)
  s.test_files            = Dir["spec/**/*"]
  s.executables           = ['shooter']

  s.required_ruby_version = '>=2.2'
  s.add_development_dependency 'rspec', '>= 3.1'
end
