require "#{File.dirname(__FILE__)}/spec_helper"

describe 'living cell' do

  before(:each) do
    @cell = Cell.new(:alive => true)
    @cell.north = Cell.new(:alive => false)
    @cell.north_east = Cell.new(:alive => false)
    @cell.east = Cell.new(:alive => false)
    @cell.south_east = Cell.new(:alive => false)
    @cell.south = Cell.new(:alive => false)
    @cell.south_west = Cell.new(:alive => false)
    @cell.west = Cell.new(:alive => false)
    @cell.north_west = Cell.new(:alive => false)
  end
  
  # 1st rule of game of life: Any living cell with fewer than two living
  # neighbours dies, as if by loneliness.
  it "should die if its lonely" do
    @cell.north.give_life
    @cell.lives?.should == false
  end
  
  # 2nd rule of game of life: Any living cell with more than three living
  # neighbours dies, as if by overcrowding
  it "should die if it has more than 3 neighbours" do
    @cell.north.give_life
    @cell.north_east.give_life
    @cell.east.give_life
    @cell.south_east.give_life
    @cell.lives?.should == false
  end
  
  # 3rd rule of game of life: Any living cell with two or three living 
  # neighbours lives, unchanged, to the next generation.
  it "should survive to the next generation if it has 2 or 3 living neighbours" do
    @cell.north.give_life
    @cell.north_east.give_life
    @cell.lives?.should == true
    
    @cell.east.give_life
    @cell.lives?.should == true
  end
end

describe 'dead cell' do
  before(:each) do
    @cell = Cell.new(:alive => false)
    @cell.north = Cell.new(:alive => false)
    @cell.north_east = Cell.new(:alive => false)
    @cell.east = Cell.new(:alive => false)
    @cell.south_east = Cell.new(:alive => false)
    @cell.south = Cell.new(:alive => false)
    @cell.south_west = Cell.new(:alive => false)
    @cell.west = Cell.new(:alive => false)
    @cell.north_west = Cell.new(:alive => false)
  end
  
   # 4th rule of game of life: Any dead cell with exactly three living
  # neighbours comes to life.
  it "should come to life if it has exactly three living neighbours" do
    @cell.lives?.should == false
    
    # bring 3 neighbours to life
    @cell.north.give_life
    @cell.north_east.give_life
    @cell.west.give_life
    
    @cell.lives?.should == true  
  end
end
