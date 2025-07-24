# frozen_string_literal: true

require_relative "lib/snake_game/version"
# require_relative "lib/snake_game"

Gem::Specification.new do |spec|
  spec.name = "snake-game"
  spec.version = SnakeGame::VERSION
  spec.authors = ["Kartik Kashyap"]
  spec.email = ["kartik.kashyap@gmail.com"]

  spec.summary = "A simple Snake game for your terminal, written in Ruby."
  spec.description = "A simple Snake game for your terminal, written in Ruby."
  spec.homepage = "https://github.com/kartik-6s/snake-game-ruby"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/kartik-6s/snake-game-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/kartik-6s/snake-game-ruby/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.glob('lib/**/*').select { |f| File.file?(f) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
