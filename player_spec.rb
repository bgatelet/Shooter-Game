# RSpec example.

require_relative 'player'

describe Player do

  before do
    @name = 'Bob'
    @player = Human.new(@name)
  end

  it "has a starting health of 3" do
    expect(@player.health).to be == 3
  end

  it "has no bullets to start with"

  context "created with no name" do

    before do
      @player = Human.new
    end

    it "has a name of anon" do
      expect(@player.name).to be == 'anon'
    end
  end
end
