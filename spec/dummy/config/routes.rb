Rails.application.routes.draw do

  resources :films
  resources :semantics

  mount FormSlider::Engine => "/form_slider"
end
