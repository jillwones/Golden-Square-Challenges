require 'report_length'

describe 'report_length method to return lengths of string' do 
  it "returns 4 when passed ruby" do 
    expected = "This string was 4 characters long."
    expect(report_length('ruby')).to eq(expected)
  end 

  it "returns 11 when passed darth vader" do 
    expected = "This string was 11 characters long."
    expect(report_length('darth vader')).to eq(expected)
  end 

  it "raises error if not string argument" do 
    expect { report_length(123) }.to raise_error "Expected argument to be a string"
  end
end 