require 'spec_helper'
require '../24-solver/24_solver.rb'

describe TwentyFourSolver do
  let(:solver) { TwentyFourSolver.new }
  it "starts with an empty array of all_expressions"do
    expect(solver.all_expressions).to be_an(Array)
  end

  describe '#get_sets_of_operations' do

  end

  # describe '#solve' do
  # end

end