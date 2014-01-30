# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name          = "dns_incrementor"
  gem.authors       = ["Dafydd Crosby"]
  gem.description   = %q{Increment serial in DNS zone files}
  gem.summary       = %q{Finally, a script to save you 2 seconds bumping the serial each time you edit a DNS zone file}

  gem.email         = "dafydd@dafyddcrosby.com"
  gem.homepage      = "https://github.com/dafyddcrosby/dns_incrementor"

  gem.license       = 'bsd' # The (two-clause) BSD License

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.version       = '1.0.2'
  gem.required_ruby_version = '>= 1.9'
end
