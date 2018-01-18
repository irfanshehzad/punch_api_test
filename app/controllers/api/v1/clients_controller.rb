class Api::V1::ClientsController < ApiController
  before_action :set_client, only: [:update,:destroy]
  def index
    @clients = Client.all
    respond_to do |format|
      format.json { render json: @clients, status: :success }
      format.xml { render xml: @clients, status: :success }
    end
  end
  
  def create
    @client = Client.new(client_params)
    respond_to do |format|
      if @client.save
        format.json { render json: @client, status: :success }
        format.xml { render xml: @client, status: :success }
      else
        format.json { render json: @client.errors.full_messages.join(','), status: :unprocessenity }
        format.xml { render xml: @client.errors.full_messages.join(','), status: :unprocessenity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.json { render json: @client, status: :success }
        format.xml { render xml: @client, status: :success }
      else
        format.json { render json: @client.errors.full_messages.join(','), status: :unprocessenity }
        format.xml { render xml: @client.errors.full_messages.join(','), status: :unprocessenity }
      end
    end
  end
  
  def destroy
    respond_to do |format|
      if @client.destroy
        format.json { render json: @client, status: :success }
        format.xml { render xml: @client, status: :success }
      else
        format.json { render json: @client.errors.full_messages.join(','), status: :unprocessenity }
        format.xml { render xml: @client.errors.full_messages.join(','), status: :unprocessenity }
      end
    end
  end
  
  def add_project_to_client
    @client = Client.find(params[:client_id])
    respond_to do |format|
      if @client.update_attribute(:project_id,params[:project_id])
        format.json { render json: @client, status: :success }
        format.xml { render xml: @client, status: :success }
      else
        format.json { render json: @client.errors.full_messages.join(','), status: :unprocessenity }
        format.xml { render xml: @client.errors.full_messages.join(','), status: :unprocessenity }
      end
    end
  end
  
  def remove_project_from_client
    @client = Client.find(params[:client_id])
    respond_to do |format|
      if @client.update_attribute(:project_id,nil)
        format.json { render json: @client, status: :success }
        format.xml { render xml: @client, status: :success }
      else
        format.json { render json: @client.errors.full_messages.join(','), status: :unprocessenity }
        format.xml { render xml: @client.errors.full_messages.join(','), status: :unprocessenity }
      end
    end
  end
  
  private
  def set_client
    @client = Client.find(params[:id])
  end
  
  def client_params
    params.require(:client).permit!
  end
  
end