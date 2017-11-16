Rails.application.routes.draw do
 root 'game#new'
 resource :games, :answers, :guesses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
