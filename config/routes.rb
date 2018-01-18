Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :projects do
        get :add_employee
        get :remove_employee
      end
      resources :clients do
        get :add_project_to_client
        get :remove_project_from_client
      end
      resources :employees
    end
  end
end
