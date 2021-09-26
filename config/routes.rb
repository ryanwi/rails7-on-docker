# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles

  root 'welcome#index'
end
