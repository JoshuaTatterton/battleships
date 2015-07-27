require "board"

describe Board do
  let(:ship){double :ship}

  it { is_expected.to respond_to :board }

  it "should initialize with a board ready to use" do
    expect(subject.board).not_to eq nil  
  end

  it "should place ships on board" do
    subject.place_ship(ship, 1,1)
    expect(subject.board[0][0]).to eq ship
  end

  it 'should raise error if ship is placed outside of the board' do
    expect {subject.place_ship(ship, 2,1)}.to raise_error 'out of map!'
  end
  
  it "should raise error if ship is placed ontop of a ship" do
    subject.place_ship(ship, 1, 1)
    expect{subject.place_ship(ship,1,1)}.to raise_error "Ship already on that spot!"
  end

  it "should be able to attack ships" do
  	expect(subject).to respond_to :fire
  end

  it "fireing should hit ship" do
  	ship = spy :ship
  	subject.place_ship(ship, 1,1)
  	subject.fire(1,1)
  	expect(ship).to have_received :hit
  end

end