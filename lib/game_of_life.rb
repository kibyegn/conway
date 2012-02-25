#!/usr/bin/env ruby

require 'cell'

class Game
    
  attr_accessor :world
    
  def initialize(size)
    @world = create_grid(size, "Cell")
  end
     
  def create_grid(size, type)
    grid = []
    1.upto(size) do
      row = []
      1.upto(size) do
        if type == "Cell"
          row << Cell.new(:alive => false)
        else
          row << false
        end
      end
      grid << row
    end
      
    return grid
  end
    
  def render_grid
    @world.each do |row|
      row.each do |cell|
        print cell.is_alive? ? " 0 " : " . "
      end
      puts
    end
  end
    
  def bring_to_life(x,y)
    @world[x][y].give_life
  end
    
  # creates connections between cells
  def create_connections
    # west east connections
    @world.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        next if cell_index == 0
        cell.west = @world[row_index][cell_index-1]
      end
    end
    # north south connections
    @world.each_with_index do |row, row_index|
      next if row_index == 0
      row.each_with_index do |cell, cell_index|
        cell.north = @world[row_index-1][cell_index]
      end
    end
    
    # north_west, south_east connections
    first = 0
    last = @world.size-1
    @world.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        unless row_index == first || row_index == last
          if cell_index == 0
          cell.north_east = @world[row_index-1][cell_index+1]
          cell.south_east = @world[row_index+1][cell_index+1]
          elsif cell_index == last
          cell.north_west = @world[row_index-1][cell_index-1]
          cell.south_west = @world[row_index+1][cell_index-1]
          else
          cell.north_east = @world[row_index-1][cell_index+1]
          cell.south_east = @world[row_index+1][cell_index+1]
          cell.south_west = @world[row_index+1][cell_index-1]
          cell.north_west = @world[row_index-1][cell_index-1]
          end
        end
      end
    end  
  end
    
  def automata
    printf("\033[H\033[2J\033[?25l")
    while(true) do
      render_grid
      sleep(0.9)
      current_generation = create_grid(30, " ")
      @world.each_with_index do |row, row_index|
        row.each_with_index do |cell, column_index|
          current_generation[row_index][column_index] = cell.lives?
        end
      end
      
      @world.each_with_index do |row, row_index|
        row.each_with_index do |cell, column_index|
          current_generation[row_index][column_index] ? cell.give_life : cell.die
        end
      end
      printf("\033[H\033[2J\033[?25l")
    end
  end
end
  
game = Game.new(30)
game.create_connections
250.times { game.bring_to_life(rand(30), rand(30)) }
# game.bring_to_life(3,3)
# game.bring_to_life(4,3)
# game.bring_to_life(5,3)
game.automata
