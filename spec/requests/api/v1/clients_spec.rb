require 'rails_helper'
describe "Clients API" do
  it 'sends a list of clients' do
    10.times { create(:client)  }

    get '/api/v1/clients.json?key=1e8bb9ef2387e59b133'
    #byebug
    json = JSON.parse(response.body)
    # check to make sure the right amount of clients are returned
    expect(json.length).to eq(10)
  end
  
  
  it 'add project to client' do
    client =  create(:client)
    project =  create(:project)

    get "/api/v1/clients/#{client.id}/add_project_to_client.json?key=1e8bb9ef2387e59b133&project_id=#{project.id}"
    json = JSON.parse(response.body)
    #byebug
    expect(json['id']).to eq(client.id)
    get "/api/v1/clients/#{client.id}/remove_project_from_client.json?key=1e8bb9ef2387e59b133&employee_id=#{project.id}"
    expect(json['id']).to eq(client.id)
  end
end