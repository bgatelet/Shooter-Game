# RSpec example.

require_relative '../../lib/shooter/player'

describe Human do
  before do
    @name = 'Bob'
    @player = Human.new(@name)
  end

  it "has a starting health of 3" do
    expect(@player.health).to be == 3
  end

  it "has no bullets to start with" do
    expect(@player.bullets).to be == 0
  end

  context "created with no name" do

    before do
      @player = Human.new
    end

    it "has a name of anon" do
      expect(@player.name).to be == 'anon'
    end
  end
end

describe Computer do
  before do
    @comp = Computer.new
  end

  it "has a starting health of 3" do
    expect(@comp.health).to be == 3
  end

  it "has no bullets to start with" do
    expect(@comp.bullets).to be == 0
  end

  it "has a random number between 0-2" do
    numb = @comp.actionAI
    expect(numb).to be_between(0, 2)
  end

  it "counts the population" do
    expect(@comp.population).to be > 0
  end

end
