class Board
  attr_accessor :cups
  attr_reader :player1, :player2

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    @player1 = name1
    @player2 = name2
    place_stones
  end

  def place_stones
    cups.map!.with_index do |cup, i|
      unless i == 6 || i == 13
        4.times { cup << :stone }
        cup
      else
        cup
      end
    end
  end

  def valid_move?(start_pos)
    unless (0..5).to_a.include?(start_pos) || (7..12).to_a.include?(start_pos)
      raise ArgumentError, 'Invalid starting cup' #unless current_player == player1
    # elsif (7..12).to_a.include?(start_pos)
    #   raise ArgumentError, 'Invalid starting cup' unless current_player == player2
    end
    raise ArgumentError, 'Starting cup is empty' if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    i = 1
    until cups[start_pos].empty?
      new_pos = (start_pos + i) % 14
      if current_player_name == player1 && new_pos != 13
        cups[new_pos] << cups[start_pos].pop
      elsif current_player_name == player2 && new_pos != 6
        cups[new_pos] << cups[start_pos].pop
      end
      i += 1
    end
    render
    next_turn(new_pos, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if (ending_cup_idx == 6 && current_player_name == player1) || (ending_cup_idx == 13 && current_player_name == player2)
      return :prompt
    elsif cups[ending_cup_idx].length == 1
      return :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if (0..5).all? { |i| cups[i].empty? } || (7..12).all? { |i| cups[i].empty? }
    false
  end

  def winner
    case cups[6] <=> cups[13]
    when -1
      return player2
    when 1
      return player1
    when 0
      return :draw
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new("first","second")
  b.make_move(12, "first",)
  p b.cups[13]
end