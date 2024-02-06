require_relative "../tic_tac_toe" 
require "pry"

RSpec.describe TicTacToe do
    describe TicTacToe::Game do
        describe "#winner" do
            context "if there is no winner" do
                it "returns nil" do
                    game = described_class.new
                    game.board = TicTacToe::Board.new([1, 0, 0, 2, 0, 0, 1, 0, 0])

                    expect(game.winner).to be_nil
                end
            end

            context "if the winning series is vertical, player 1" do
                it "returns 1" do
                    game = described_class.new
                    game.board = TicTacToe::Board.new([1, 0, 0, 1, 0, 0, 1, 0, 0])

                    expect(game.winner).to eq(1)
                end
            end

            context "if the winning series is horizontal, player 1" do
                it "returns 1" do
                    game = described_class.new
                    game.board = TicTacToe::Board.new([2, 0, 1, 1, 1, 1, 1, 2, 2])

                    expect(game.winner).to eq(1)
                end
            end

            context "if the winning series is vertical, player 2" do
                it "returns 2" do
                    game = described_class.new
                    game.board = TicTacToe::Board.new([1, 0, 2, 2, 0, 2, 1, 0, 2])

                    expect(game.winner).to eq(2)
                end
            end

            context "if the winning series is horizontal, player 2" do
                it "returns 1" do
                    game = described_class.new
                    game.board = TicTacToe::Board.new([2, 0, 1, 2, 2, 2, 1, 2, 1])

                    expect(game.winner).to eq(2)
                end
            end

            context "if the winning series is diagonal, player 1" do
                it "returns 1" do
                    game = described_class.new
                    game.board = TicTacToe::Board.new([2, 0, 1, 1, 1, 2, 1, 2, 2])

                    expect(game.winner).to eq(1)
                end
            end

            context "if the winning series is diagonal, player 2" do
                it "returns 2" do
                    game = described_class.new
                    game.board = TicTacToe::Board.new([0, 0, 2, 1, 2, 2, 2, 0, 2])

                    expect(game.winner).to eq(2)
                end
            end
        end
    end
end