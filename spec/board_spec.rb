require "board"

describe Board do
  it { is_expected.to respond_to :board }

  it "should initialize with a board ready to use" do
    expect(subject.board).not_to eq nil  
  end

  it "should place ships on board" do
    ship = double :ship
    subject.place_ship(ship, 1,1)
    expect(subject.board[0][0]).to eq ship
  end

  it 'should raise error if ship is placed outside of the board' do
  	ship = double :ship
    expect {subject.place_ship(ship, 2,1)}.to raise_error 'out of map!'
  end

end