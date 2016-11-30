class TicTacToe

  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, value = "X")
    @board[input.to_i - 1] = value
  end

  def position_taken?(input)
    @board[input.to_i] != " "
  end

  def valid_move?(input)
    !position_taken?(input.to_i - 1) && input.to_i.between?(1, 9)
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def turn_count
    numturns = 0
    @board.each do |position|
      if position != " "
        numturns += 1
      end
    end
    numturns
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)

    if valid_move?(input)
      move(input, current_player)

      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|

        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

           if position_1 == "X" && position_2 == "X" && position_3 == "X"
             return win_combination
           elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
             return win_combination
           else
             false
          end
      end
      false
  end

  def full?
    @board.all? {|position| position != " "}
  end

  def draw?
    if full? == false
      false
    elsif won? == false
      true
    else
      false
    end
  end

  def over?
    if won?
      true
    elsif draw?
      true
    else
      false
    end
  end

  def winner
    won?
        WIN_COMBINATIONS.each do |win_combination|

            win_index_1 = win_combination[0]
            win_index_2 = win_combination[1]
            win_index_3 = win_combination[2]

            position_1 = @board[win_index_1]
            position_2 = @board[win_index_2]
            position_3 = @board[win_index_3]

               if position_1 == "X" && position_2 == "X" && position_3 == "X"
                 return "X"
               elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
                 return "O"
               end
             end
            else nil
    end

    def play
      until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
