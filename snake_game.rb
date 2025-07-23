# Snake game for terminal
require 'io/console'
require './anim.rb'
class SnakeGame
  # WIDTH = 30
  # HEIGHT = 15
  WIDTH = 40
  HEIGHT = 20
  SLEEP_TIME = 0.125
  HEAD = 'H'
  TAIL = 'T'
  FOOD = 'o'
  BODY = '@'
  def initialize
    @board = create_board
    put_snake
    @blocked = create_blocked
    put_food
    @game_over = false
    @direction = :right
    @score = 0
    @sleep_time = 0.5
  end

  def create_board
    board = Array.new(HEIGHT) { Array.new(WIDTH, ' ') }
    board.each do |row|
      row[0] = '|'
      row[WIDTH-1] = '|'
    end
    (0..WIDTH-1).each do |col|
      board[0][col] = '-'
      board[HEIGHT-1][col] = '-'
    end
    board[HEIGHT-1][WIDTH-1] = '+'
    board[HEIGHT-1][0] = '+'
    board[0][0] = '+'
    board[0][WIDTH-1] = '+'
    board
  end

  def create_blocked
    blocked = Array.new(HEIGHT) { Array.new(WIDTH, false) }
    (0..HEIGHT-1).each do |row|
      (0..WIDTH-1).each do |col|
        blocked[row][col] = true if @board[row][col] != ' '
      end
    end
    blocked[HEIGHT / 2][WIDTH / 2] = :right
    blocked[HEIGHT / 2][WIDTH / 2 - 1] = :right
    blocked
  end

  def put_snake
    @board[HEIGHT / 2][WIDTH / 2] = HEAD
    @board[HEIGHT / 2][WIDTH / 2 - 1] = TAIL
    @head = [HEIGHT / 2, WIDTH / 2]
    @tail = [HEIGHT / 2, WIDTH / 2 - 1]
  end

  # Put food in @board where @blocked is false
  def put_food
    pos = []
    loop do
      pos = [rand(HEIGHT), rand(WIDTH)]
      break unless @blocked[pos[0]][pos[1]]
    end
    @board[pos[0]][pos[1]] = FOOD
  end

  def run
    # clear terminal
    system('clear')

    # print board
    print_board

    # print blocked
    # @blocked.each do |row|
    #   row.each do |col|
    #     print 1 if col
    #     print 0 if !col
    #   end
    #   puts
    # end

    # game loop
    until game_over
      # Wait for input for SLEEP_TIME seconds
      STDIN.raw do
        if IO.select([STDIN], nil, nil, @sleep_time)
          input = STDIN.getch
          case input
          when 'w', 'W', "\e[A"
            @direction = :up
          when 's', 'S', "\e[B"
            @direction = :down
          when 'd', 'D', "\e[C"
            @direction = :right
          when 'a', 'A', "\e[D"
            @direction = :left
          when 'q', 'Q'
            @game_over = true
          end
        end
      end
      move(@direction)
      system('clear')
      print_board
    end
    animate(@score)
  end
  
  def move(direction)
    head = @head.dup
    tail = @tail.dup
    case direction
    when :up
      head[0] -= 1
    when :down
      head[0] += 1
    when :left
      head[1] -= 1
    when :right
      head[1] += 1
    end
    if @board[head[0]][head[1]] == FOOD
      @score += 1
      @sleep_time -= 0.025
      @board[head[0]][head[1]] = HEAD
      @board[@head[0]][@head[1]] = TAIL
      @blocked[@head[0]][@head[1]] = direction
      @blocked[head[0]][head[1]] = direction
      put_food
    elsif @blocked[head[0]][head[1]]
      @game_over = true
      return
    else
      @board[head[0]][head[1]] = HEAD
      @board[@head[0]][@head[1]] = BODY
      @board[@tail[0]][@tail[1]] = ' '
      tail_direction = @blocked[@tail[0]][@tail[1]]
      case tail_direction
      when :up
        tail[0] -= 1
      when :down
        tail[0] += 1
      when :left
        tail[1] -= 1
      when :right
        tail[1] += 1
      end
      @board[tail[0]][tail[1]] = TAIL
      @blocked[@head[0]][@head[1]] = direction
      @blocked[head[0]][head[1]] = direction
      @blocked[@tail[0]][@tail[1]] = false
    end
    @head = head
    @tail = tail
  end

  def print_board
    @board.each do |row|
      row.each do |col|
        print col
      end
      puts
    end
  end

  def game_over
    @game_over
  end
end

game = SnakeGame.new
game.run
