Rails.application.routes.draw do

   root 'welcome#index'

  post 'matchBarbershops' => 'barbershops#search'
  resource :barbershops , only: [:create, :index] do
    get ':id' => 'barbershops#show'
  end
end
