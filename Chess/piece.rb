require "singleton"

class Piece
  
  attr_reader :color, :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos 
  end

  def inspect
    @color
  end

end

class NullPiece < Piece
  include Singleton
  def initialize
    @color = ""
  end
  # def moves
  # end
  # def symbol
  # end
end