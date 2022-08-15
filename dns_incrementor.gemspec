# frozen_string_literal: true

require "English"
Gem::Specification.new do |gem|
  gem.name          = "dns_incrementor"
  gem.authors       = ["Dafydd Crosby"]
  gem.description   = "Increment serial in DNS zone files"
  gem.summary       = "Finally, a script to save you 2 seconds bumping the serial each time you edit a DNS zone file"

  gem.email         = "dafydd@dafyddcrosby.com"
  gem.homepage      = "https://github.com/dafyddcrosby/dns_incrementor"

  gem.license       = "bsd" # The (two-clause) BSD License

  gem.files         = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.version       = "1.1.0"
  gem.required_ruby_version = ">= 2.5"
  gem.metadata["rubygems_mfa_required"] = "true"
end
