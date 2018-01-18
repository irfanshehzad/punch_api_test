class Api::V1::EmployeesController < ApiController
  before_action :set_employee, only: [:update,:destroy]
  def index
    @employees = Employee.all
    respond_to do |format|
      format.json { render json: @employees, status: :success }
      format.xml { render xml: @employees, status: :success }
    end
  end
  
  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        format.json { render json: @employee, status: :success }
        format.xml { render xml: @employee, status: :success }
      else
        format.json { render json: @employee.errors.full_messages.join(','), status: :unprocessenity }
        format.xml { render xml: @employee.errors.full_messages.join(','), status: :unprocessenity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.json { render json: @employee, status: :success }
        format.xml { render xml: @employee, status: :success }
      else
        format.json { render json: @employee.errors.full_messages.join(','), status: :unprocessenity }
        format.xml { render xml: @employee.errors.full_messages.join(','), status: :unprocessenity }
      end
    end
  end
  
  def destroy
    respond_to do |format|
      if @employee.destroy
        format.json { render json: @employee, status: :success }
        format.xml { render xml: @employee, status: :success }
      else
        format.json { render json: @employee.errors.full_messages.join(','), status: :unprocessenity }
        format.xml { render xml: @employee.errors.full_messages.join(','), status: :unprocessenity }
      end
    end
  end
  
  private
  def set_employee
    @employee = Employee.find(params[:id])
  end
  
  def employee_params
    params.require(:employee).permit!
  end
  
end