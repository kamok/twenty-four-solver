require 'spec_helper'
require '../24-solver/24_solver.rb'

describe TwentyFourSolver do
  let(:solver) { TwentyFourSolver.new }

  it "starts with an empty array of all_expressions"do
    expect(solver.all_expressions).to be_an(Array)
  end

  describe '#solve' do
    # after(:each) do
    #   solver.solve([1,2,3,4])
    # end

    it "calls make_possible_solutions with get_sets_of_numbers" do
      expect(solver).to receive(:make_possible_solutions).with(solver.get_sets_of_numbers([1,2,3,4]))
      solver.solve([1,2,3,4])
    end
  end

  describe '#get_sets_of_numbers' do
    before(:each) do
      @method_yield = solver.get_sets_of_numbers([1,2,3,4])
    end

    it "returns an array of 24 arrays" do
      expect(@method_yield.class).to be(Array)

      expect(@method_yield.count).to be(24)

      @method_yield.each do |thing|
        expect(thing.class).to be(Array)
      end
    end

    it "each array it returns comprises of the original input" do
      @method_yield.each do |array|
        expect(array) =~ [1,2,3,4]
      end
    end
  end




  # describe '#get_sets_of_operations' do

  # end

  

end