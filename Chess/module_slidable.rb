module Slideable

  def horizontal_dirs
    curent_pos = self.pos
    possible_pos = []
    pos_dup = current_pos.dup

    HORIZONTAL_DIRS.each do |dir|
      7.times do
        new_pos = [pos_dup[0] + dir[0], pos_dup[1] + dir[1]]
        possible_pos << new_pos
        pos_dup = new_pos
      end
      pos_dup = current_pos
    end
  end

  def diagonal_dirs
    curent_pos = self.pos
    possible_pos = []
    pos_dup = current_pos.dup

    DIAGONAL_DIRS.each do |dir|
      7.times do
        new_pos = [pos_dup[0] + dir[0], pos_dup[1] + dir[1]]
        possible_pos << new_pos
        pos_dup = new_pos
      end
      pos_dup = current_pos
    end
  end

  private

  HORIZONTAL_DIRS = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0]
  ]
  DIAGONAL_DIRS =[
    [1, -1],
    [1, 1],
    [-1, -1],
    [-1, 1]
  ]
end

