require 'rails_helper'

RSpec.describe 'User sign up', type: :request do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new user' do
        expect do
          post user_registration_path, params: { user: attributes_for(:user) }
        end.to change { User.count }.by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new user' do
        expect do
          post user_registration_path, params: { user: attributes_for(:user, email: nil) }
        end.not_to change(User, :count)
      end

      it 're-renders the registration form' do
        post user_registration_path, params: { user: attributes_for(:user, email: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'POST #login' do
    let(:user) { create(:user) }

    context 'with valid login credentials' do
      it 'logs in the user' do
        post user_session_path, params: { user: { email: user.email, password: user.password } }
        follow_redirect!
        expect(response.body).to include('Signed in successfully.')
      end
    end

    context 'with invalid login credentials' do
      it 're-renders the login form' do
        post user_session_path, params: { user: { email: user.email, password: 'incorrect_password' } }
        expect(response).to render_template(:new)
      end

      it 'does not log in the user' do
        post user_session_path, params: { user: { email: user.email, password: 'incorrect_password' } }
        expect(response.body).to include('Invalid Email or password.')
      end
    end
  end
end
