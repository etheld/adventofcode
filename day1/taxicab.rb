#!/usr/bin/ruby


class Position 

  @@directions = ["N","E","S","W"]
  attr_accessor :posx, :posy

  def initialize(facing, posx, posy)
    @facing = facing
    @posx = posx
    @posy = posy
  end

  def move(direction, distance)
    newdir = @@directions.index(@facing)
    if direction == "R" then
      newdir = (newdir + 1) % 4;
    else 
      newdir = (newdir + 3) % 4;
    end

    @facing = @@directions[newdir]
    if @facing == "W" then
      @posx -= distance.to_i
    elsif @facing == "E" then
      @posx += 1*distance.to_i
    elsif @facing == "N" then
      @posy -= distance.to_i
    elsif @facing == "S" then
      @posy += distance.to_i
    end

  end

  def to_s
    "X: #{@posx} Y: #{@posy} Facing: #{@facing}"
  end

    
end

p = Position.new("N", 0, 0)

File.read('day1.input').split(", ").each do |e|
  m = e.strip.match(/([R,L])(.*)/)
  dir = m[1]
  distance = m[2]
  p.move(dir, distance)
end

puts "Result: #{p.posx.abs+p.posy.abs}"


