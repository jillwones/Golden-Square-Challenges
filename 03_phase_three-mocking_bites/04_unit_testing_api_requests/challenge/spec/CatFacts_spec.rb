require 'CatFacts'

describe CatFacts do
  it 'returns a random cat fact' do 
    requester_double = double(:requester)
    allow(requester_double).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return('{"fact":"Cat bites are more likely to become infected than dog bites.","length":60}')
    cat_fact = CatFacts.new(requester_double)
    expect(cat_fact.provide).to eq("Cat fact: Cat bites are more likely to become infected than dog bites.")
  end
end