# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


create a new rails app as an api - rails new 'project-name' --api database=postgresql

push to git hub

add gems to gemfile - jwt, active_model_serializers, and faker

uncomment rack-cors and bcrypt

update cors in initialisers
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
 
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end


bundle install


rails g model User username password_digest

rails g controller users

rails g serizlizer user

rails db:create

rails db:migrate

create a route to create a user
Rails.application.routes.draw do
  resources :users, only: [:create]
end


update user model - add password authentication and vaildations
class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
end

add user_serializer actions

----
create a login route
createa a longin contorller/action
look up a user
authenticatea them
create a token
-- sign it
-- send it
