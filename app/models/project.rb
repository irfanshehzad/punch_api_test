class Project < ApplicationRecord
  validates_presence_of :name
  has_many :clients
  has_many :employee_projects
  has_many :employees, through: :employee_projects
end
