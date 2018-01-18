require 'rails_helper'
describe "Employees API" do
  it 'sends a list of employees' do
    10.times { create(:employee)  }

    get '/api/v1/clients.json?key=1e8bb9ef2387e59b133'
    #byebug
    json = JSON.parse(response.body)
    # check to make sure the right amount of clients are returned
    expect(json.length).to eq(10)
  end
end