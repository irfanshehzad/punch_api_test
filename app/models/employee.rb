class Employee < ApplicationRecord
  validates_presence_of :name
  has_many :employee_projects
  has_many :projects, through: :employee_projects
end
