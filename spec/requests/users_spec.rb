require 'rails_helper'

RSpec.describe 'User sign up', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:user_attributes) { FactoryBot.attributes_for(:user) }

  it 'creates a new user' do
    post user_registration_path, params: { user: user_attributes }
    expect(response).to have_http_status(302) # Redirects after successful sign up
    follow_redirect!
    expect(response).to render_template(:edit) # Change this based on your setup
  end

  it 'handles invalid sign up' do
    post user_registration_path, params: { user: user_attributes.merge(email: '') }
    expect(response).to have_http_status(200) # Re-renders the sign-up form
    expect(response).to render_template(:new) # Change this based on your setup
  end

  it 'logs in a user' do
    post user_session_path, params: { user: { email: user.email, password: user.password } }
    expect(response).to have_http_status(302) # Redirects after successful login
    follow_redirect!
    expect(response).to render_template(:some_template) # Change this based on your setup
  end

  it 'handles invalid login' do
    post user_session_path, params: { user: { email: user.email, password: 'invalid_password' } }
    expect(response).to have_http_status(200) # Re-renders the login form
    expect(response).to render_template(:new) # Change this based on your setup
  end

  it 'updates user details' do
    sign_in user # Implement a sign-in helper based on your Devise configuration
    put user_registration_path, params: { user: { first_name: 'New First Name', last_name: 'New Last Name', email: 'new@example.com', current_password: user.password } }
    expect(response).to have_http_status(302) # Redirects after successful update
    follow_redirect!
    expect(response).to render_template(:some_template) # Change this based on your setup
  end

  it 'handles invalid update' do
    sign_in user
    put user_registration_path, params: { user: { email: '' } }
    expect(response).to have_http_status(200) # Re-renders the update form
    expect(response).to render_template(:edit) # Change this based on your setup
  end

  it 'cancels the user account' do
    sign_in user
    delete user_registration_path
    expect(response).to have_http_status(302) # Redirects after successful cancellation
    follow_redirect!
    expect(response).to render_template(:some_template) # Change this based on your setup
  end
end
