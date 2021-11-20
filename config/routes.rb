Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  match '/assignment_one',    to: 'pages#assignment_one',    via: 'get'
  root to: "pages#home"
end
