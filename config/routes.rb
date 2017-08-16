Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  get '/visualizar_papeleta' => "welcome#visualizar_papeleta"
  get '/totales' => "reportes#totales"
  get '/departamentos' => "reportes#departamentos"
  get '/sectores' => "reportes#sectores"
  root "welcome#index"
end
