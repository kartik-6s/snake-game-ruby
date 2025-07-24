# frozen_string_literal: true

require_relative "../snake_g"
require_relative "snake_game/version"

module SnakeGame
  def config
    @config ||= Config.new
  end

  def configure
    yield config
  end

  def start_game
    SnakeG.new.run
  end
end
