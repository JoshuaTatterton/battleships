require "board"

describe Board do
  it { is_expected.to respond_to :board }

  it "should initialize with a board ready to use" do
    expect(subject.board).not_to eq nil  
  end
end