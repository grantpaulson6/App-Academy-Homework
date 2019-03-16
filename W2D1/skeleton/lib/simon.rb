require 'byebug'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
  end

  def show_sequence
    add_random_color
    system "clear"
    puts "Current sequence:"
    sleep 1
    system "clear"
    seq.each_with_index do |color,i|
      puts "element #{i+1}"
      puts color
      sleep 1
      system "clear"
    end
  end

  def require_sequence
    #get user input of sequence guess.  game over if one is wrong
    i = 0
    while i < sequence_length
      puts "Enter element #{i+1} in sequence"
      guess = gets.chomp.downcase
      system "clear"

      if guess[0] != seq[i][0]
        @game_over = true
        break
      end
      i += 1
    end
    if i == sequence_length
      round_success_message
      self.sequence_length += 1 
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You survived that round!"
    sleep 1
  end

  def game_over_message
    puts "Game over. You got a score of #{sequence_length}"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

# s = Simon.new
# s.play