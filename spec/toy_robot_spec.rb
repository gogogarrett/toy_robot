require 'spec_helper'

describe ToyRobot do

  it "should be placed on the screen" do 
    subject.place("0", "0", "NORTH")
    subject.report.should == "0, 0, NORTH"
  end

  it "should move up one when facing north" do
    subject.place("0", "0", "NORTH")
    subject.move
    subject.y.should == 1
  end

  it "should turn counter clockwise" do
    subject.place("0", "0", "NORTH")
    subject.left
    subject.dir.should == "WEST"
    subject.left
    subject.dir.should == "SOUTH"
  end

  it "should turn clockwise" do
    subject.place("0", "0", "NORTH")
    subject.right
    subject.dir.should == "EAST"
    subject.right
    subject.dir.should == "SOUTH"
  end

  it "should not fall off" do
    subject.place("5", "5", "NORTH")
    subject.move.should == false
  end

end