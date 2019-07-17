require_relative "piece"

class Board

attr_reader :board


def initialize
  @board = Array.new(8) {Array.new(8)}
end

def add_pieces
  (0..1).each do |row|
    (0..7).each do |col|
      pos = [row, col]
      self[pos] = Piece.new(:white, self, pos)
    end
  end

  (6..7).each do |row|
    (0..7).each do |col|
      pos = [row, col]
      self[pos] = Piece.new(:yellow, self, pos)
    end
  end  

  (2..5).each do |row|
    (0..7).each do |col|
      pos = [row, col]
      self[pos] = NullPiece.instance
    end
  end 
end

def move_piece(start_pos, end_pos)
  if self[start_pos] == ""
    raise "No piece there!"
  elsif !(self[end_pos] == "")
    raise "Can't move the piece there"
  else
    self[end_pos] = self[start_pos]
    self[start_pos] = ""
  end
end


def render
  self.board.each do |row|
    puts row.map(&:inspect).join("   ")
  end
end

def [](pos)
  row, col = pos
  @board[row][col]

end

def []=(pos, value)
  row, col = pos
  @board[row][col] = value 
end

end

board1 = Board.new()
board1.add_pieces
board1.render
# board1.move_piece([0,0], [0,1])
# board1.render

