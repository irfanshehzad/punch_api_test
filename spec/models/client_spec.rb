require 'rails_helper'

RSpec.describe Client, type: :model do
  it "has a valid factory" do
  	client = create(:client)
    expect(client).to be_valid
  end
end