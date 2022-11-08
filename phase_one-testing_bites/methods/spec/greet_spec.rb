require 'greet'

describe "greet method to greet" do
  it "accepts 'Will' and return 'Hello, Will!'" do 
    expect(greet('Will')).to eq('Hello, Will!')
  end
end
