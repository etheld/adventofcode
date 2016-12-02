#!/usr/bin/ruby


class Position

  attr_accessor :posx, :posy, :code


  @@map = {
    0 =>     [1],
    1 =>     [1, 2, 3],
    2 =>  [0, 1, 2, 3, 4],
    3 =>     [1, 2, 3],
    4 =>     [1]
  }
  def initialize(posx, posy)
    @posx = posx
    @posy = posy
    @code = []
  end

  def step()
  end

  def field_value()
    @posy*3+@posx + 1
  end

  def parseLines(lines)
    lines.split("\n").each do |moves|
      moves.split("").each do |move|
        self.move(move)
      end
      @code << field_value()
    end
  end

  def move(move)
    newposx = @posx
    newposy = @posy
    if move == "L"
      newposx -= 1
    elsif move == "R" then
      newposx += 1
    elsif move == "U" then
      newposy -= 1
    else move = "D"
      newposy += 1
    end
    puts "moving to #{newposx} + #{newposy}"
    if self.validMove(newposx, newposy) then
      puts "valid"
        @posx = newposx
        @posy = newposy
    else
        puts "oinvalid"
      end

  end
  def validMove(newposx, newposy)
    return @@map[newposx].include?(newposy) && @@map[newposy].include?(newposx)
  end
end

if __FILE__ == $0
  p = Position.new(0, 0)
  p.parseMoves(File.read('day1.input'))

  puts "* result: #{p.distance()}"
  puts "** Result: #{p.firstvisited}"
end
