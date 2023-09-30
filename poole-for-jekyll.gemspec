# # frozen_string_literal: true

# Gem::Specification.new do |spec|
#   spec.name          = "poole-for-jekyll"
#   spec.version       = "3.0.0"
#   spec.authors       = ["Mark Otto"]
#   spec.email         = ["markdotto@gmail.com"]

#   spec.summary       = "The Jekyll Butler. A no frills responsive Jekyll blog theme."
#   spec.homepage      = "https://getpoole.com"
#   spec.license       = "MIT"

#   spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

#   spec.add_runtime_dependency "jekyll", "~> 4.0"

#   spec.add_development_dependency "bundler", "~> 1.16"
#   spec.add_development_dependency "rake", "~> 12.0"
# end
# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name          = "jekyll-theme-hacker"
  s.version       = "0.2.0"
  s.license       = "CC0-1.0"
  s.authors       = ["Jason Costello", "GitHub, Inc."]
  s.email         = ["opensource+jekyll-theme-hacker@github.com"]
  s.homepage      = "https://github.com/pages-themes/hacker"
  s.summary       = "Hacker is a Jekyll theme for GitHub Pages"

  s.files         = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r{^((_includes|_layouts|_sass|assets)/|(LICENSE|README)((\.(txt|md|markdown)|$)))}i)
  end

  s.required_ruby_version = ">= 2.4.0"

  s.platform = Gem::Platform::RUBY
  s.add_runtime_dependency "jekyll", "> 3.5", "< 5.0"
  s.add_runtime_dependency "jekyll-seo-tag", "~> 2.0"
  s.add_development_dependency "html-proofer", "~> 3.0"
  s.add_development_dependency "rubocop-github", "~> 0.16"
  s.add_development_dependency "w3c_validators", "~> 1.3"
end