require 'rails_helper'
describe "Projects API" do
  it 'sends a list of clients' do
    10.times { create(:project)  }

    get '/api/v1/projects.json?key=1e8bb9ef2387e59b133'
    #byebug
    json = JSON.parse(response.body)
    # check to make sure the right amount of projects are returned
    expect(json.length).to eq(10)
  end
  
  it 'add employee to project' do
    project =  create(:project)
    employee =  create(:employee)

    get "/api/v1/projects/#{project.id}/add_employee.json?key=1e8bb9ef2387e59b133&employee_ids=#{employee.id}"
    json = JSON.parse(response.body)
    #byebug
    expect(json['id']).to eq(project.id)
    get "/api/v1/projects/#{project.id}/remove_employee.json?key=1e8bb9ef2387e59b133&employee_id=#{employee.id}"
    expect(json['id']).to eq(project.id)
  end
end