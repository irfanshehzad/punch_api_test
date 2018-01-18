class Api::V1::ProjectsController < ApiController
  before_action :set_project, only: [:update,:destroy]
  def index
    @projects = Project.all
    respond_to do |format|
      format.json { render json: @projects, status: :success }
      format.xml { render xml: @projects, status: :success }
    end
  end
  
  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.json { render json: @project, status: :success }
        format.xml { render xml: @project, status: :success }
      else
        format.json { render json: @project.errors.full_messages.join(','), status: :unprocessenity }
        format.xml { render xml: @project.errors.full_messages.join(','), status: :unprocessenity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.json { render json: @project, status: :success }
        format.xml { render xml: @project, status: :success }
      else
        format.json { render json: @project.errors.full_messages.join(','), status: :unprocessenity }
        format.xml { render xml: @project.errors.full_messages.join(','), status: :unprocessenity }
      end
    end
  end
  
  def destroy
    respond_to do |format|
      if @project.destroy
        format.json { render json: @project, status: :success }
        format.xml { render xml: @project, status: :success }
      
      else
        format.json { render json: @project.errors.full_messages.join(','), status: :unprocessenity }
        format.xml { render xml: @project.errors.full_messages.join(','), status: :unprocessenity }
      end
    end
  end
  
  def add_employee
    @project = Project.find params[:project_id]
    @project.employee_ids = params[:employee_ids]
    respond_to do |format|
      format.json { render json: @project, status: :success }
      format.xml { render xml: @project, status: :success }
    end
  end
  
  def remove_employee
    @project = Project.find params[:project_id]
    @project.employee_projects.where(employee_id: params[:employee_id]).destroy_all
    respond_to do |format|
      format.json { render json: @project, status: :success }
      format.xml { render xml: @project, status: :success }
    end
  end
  
  private
  def set_project
    @project = Project.find(params[:id])
  end
  
  def project_params
    params.require(:project).permit!
  end
  
end