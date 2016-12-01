Rails.application.routes.draw do
  root 'static_pages#home'
  get  'static_pages/home'

  resources :limpezas
  resources :quartos
  resources :tipo_servicos
  resources :empregados
  resources :clientes
  resources :hotels
  resources :tipo_quartos
  resources :reservas
  resources :servicos
  resources :estadias
end
