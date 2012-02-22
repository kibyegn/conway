#!/usr/bin/env ruby
# Represents a cell in Conway's game of life
# A cell is governed by 4 rules
# 1. Any living cell with fewer than two living neighbours dies, 
# as if by loneliness.
# 2. Any living cell with more than three living neighbours dies, 
# as if by overcrowding
# 3. Any living cell with two or three living neighbours lives, unchanged, 
# to the next generation.
# 4. Any dead cell with exactly three living neighbours comes to life.
  
class Cell  
  attr_accessor :alive, :north, :north_east, :east, :south_east, :south, 
  :south_west, :west, :north_west
    
  def initialize(params)
    @alive = params[:alive]
    @north = north
    @north_east = north_east
    @east = east
    @south_east = south_east
    @south = south
    @south_west = south_west
    @west = west
    @north_west = north_west
  end
    
  def north=(cell)
    @north = cell
    @north.south = self unless @north.south 
  end
  
  def north_east=(cell)
    @north_east = cell
    @north_east.south_west = self unless @north_east.south_west 
  end
  
  def east=(cell)
    @east = cell
    @east.west = self unless @east.west 
  end
  
  def south_east=(cell)
    @south_east = cell
    @south_east.north_west = self unless @south_east.north_west 
  end
    
  def south=(cell)
    @south = cell
    @south.north = self unless @south.north 
  end
  
  def south_west=(cell)
    @south_west = cell
    @south_west.north_east = self unless @south_west.north_east
  end
    
  def west=(cell)
    @west = cell
    @west.east = self unless @west.east
  end
  
  def north_west=(cell)
    @north_west = cell
    @north_west.south_east = self unless @north_west.south_east
  end
    
  
    
  def neighbours
    neighbours = []
    neighbours << self.north
    neighbours << self.north_east
    neighbours << self.east
    neighbours << self.south_east
    neighbours << self.south
    neighbours << self.south_west
    neighbours << self.west
    neighbours << self.north_west
    neighbours
  end
    
  def is_alive?
    @alive
  end
    
  def die
    @alive = false
  end
    
  def give_life
    @alive = true
  end
    
  def lives?
    living_neighbours = 0
    lives = false
    neighbours.each do |neighbour|
      if neighbour
        living_neighbours += 1 if neighbour.is_alive?
      end
    end
      
    if self.is_alive?
      if living_neighbours < 2
        lives = false
      elsif living_neighbours > 3
        lives = false 
      elsif living_neighbours == 2 || living_neighbours == 3
        lives = true # unchanged
      else
        # do nothing
      end
    else
      if living_neighbours == 3
        lives = true
      end
    end
      
    return lives   
  end    
end
