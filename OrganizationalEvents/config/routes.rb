Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :events
      resources :organizations
      resources :organizations, path: 'organization' do
        collection do
          get ':orgname', action: :show          
        end
      end
    end
  end
end
