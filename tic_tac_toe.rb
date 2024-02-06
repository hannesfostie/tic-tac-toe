# frozen_string_literal: true

require "tty-prompt"
require "matrix"

class TicTacToe
    class Game
        attr_accessor :board, :prompt

        def initialize
            @board = Board.new
            @prompt = TTY::Prompt.new
        end

        def play
            loop do
                if board.full?
                    puts board.draw
                    puts "It's a draw!"
                    break
                end

                choice = prompt.select(game_prompt, board.available_squares)
                board.toggle(choice)

                if winner
                    puts board.draw
                    puts "The winner is #{winner}"
                    break
                end
            end
        end

        def game_prompt
            <<~PROMPT
            #{board.draw}

            It's the turn of player #{board.next_player} (character: #{board.player_value(board.next_player)}) - pick a square!
            PROMPT
        end

        def winner
            matrix = ::Matrix[*board.values.each_slice(3).to_a]
            matrix.row_vectors.each do |vector| 
                if vector.uniq.size == 1 && vector[0] != 0
                    return vector[0]
                end
            end

            matrix.column_vectors.each do |vector| 
                if vector.uniq.size == 1 && vector[0] != 0
                    return vector[0]
                end
            end

            middle_square = board.values[4]

            # Should probably look into a method on Matrix to make sure this doesn't simply exist.
            if (middle_square == board.values[0] && middle_square == board.values[8]) ||
                (middle_square == board.values[2] && middle_square == board.values[6])
                return middle_square unless middle_square == 0
            end

            nil
        end
    end

    class Board
        attr_reader :values

        def initialize(values = [0, 0, 0, 0, 0, 0, 0, 0, 0])
            @values = values
        end

        def toggle(choice)
            raise StandardError.new("something went wrong") unless values[choice] == 0

            values[choice] = next_player
        end

        def next_player
            if values.tally[1].to_i > values.tally[2].to_i
                2
            else
                1
            end
        end

        def player_value(player)
            case player
            when 1
                "o"
            when 2
                "x"
            end
        end

        def available_squares
            # The output of this method is what the tty-prompt library uses for the input selection
            values.each_with_index.map do |value, index|
                if value == 0
                    { name: "Square #{index}", value: index }
                end
            end.compact
        end

        def full?
            available_squares.empty?
        end

        def draw
            drawn_values = values.map do |v|
                case v
                when 1
                    "o"
                when 2
                    "x"
                else
                    "_"
                end
            end

            drawn_values.each_slice(3).to_a.map { |slice| slice.join(" ") }.join("\n")
        end
    end
end