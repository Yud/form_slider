Rails.application.routes.draw do

  resources :films

  mount FormSlider::Engine => "/form_slider"
end
