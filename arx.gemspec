# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "arx/version"

Gem::Specification.new do |spec|
  spec.name          = "arx"
  spec.version       = Arx::VERSION
  spec.authors       = ["Artem Tseranu"]
  spec.email         = ["artem_tseranu@fastmail.com"]

  spec.summary       = %q{Make methods, that may return results of different types, safer.}
  spec.homepage      = "https://github.com/artem-tseranu/arx"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
