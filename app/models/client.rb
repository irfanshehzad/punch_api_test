class Client < ApplicationRecord
  validates_presence_of :name
  belongs_to :employee, required: false
end
