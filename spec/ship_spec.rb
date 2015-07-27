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

  it "should respond to hit" do
    expect(subject).to respond_to :hit
  end

  it "should get hit by hit" do
    subject.set_location([1,1])
    subject.hit
    expect(subject.status).to eq [[1,1],"h"]
  end

end