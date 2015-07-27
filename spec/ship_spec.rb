require "ship"

describe Ship do
  it "should respond to status request" do
    expect(subject).to respond_to :status
  end

  it "should respond to set location with 1 arguement" do
    expect(subject).to respond_to(:set_location).with(1).argument
  end

  it "should tell the ship its location" do
    subject.set_location([1,2])
    expect(subject.status).to eq [[1,2], "s"]
  end






end