require "board"

describe Board do
  let(:ship){double :ship, set_location: [1,1]}

  it { is_expected.to respond_to :board }

  it "should initialize with a board ready to use" do
    expect(subject.board).not_to eq nil  
  end
  
  context "when placing a ship" do
    it "should place ships on board" do
      subject.place_ship(ship, 1,1)
      expect(subject.board[0][0]).to eq "s"
    end

    it 'should raise error if ship is placed outside of the board' do
      expect {subject.place_ship(ship, 2,1)}.to raise_error 'out of map!'
    end
  
    it "should raise error if ship is placed ontop of a ship" do
      subject.place_ship(ship, 1, 1)
      expect{subject.place_ship(ship,1,1)}.to raise_error "Ship already on that spot!"
    end

    it "board should feed the ship it's location" do
      ship = spy :ship
      subject.place_ship(ship,1,1)
      expect(ship).to have_received(:set_location).with([1,1])
    end
  end 

  context "when fireing at a space" do
    it "should be able to attack ships" do
      expect(subject).to respond_to :fire
    end

    it "should hit ship" do
      ship = spy :ship, status: [1,1]
      subject.place_ship(ship, 1,1)
      subject.fire(1,1)
      expect(ship).to have_received :hit
    end
  end
end