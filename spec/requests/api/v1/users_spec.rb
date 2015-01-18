require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let(:user_json) { { id: user.id, name: user.name, email: user.email } }
  let(:response_json) { JSON.parse(response.body).deep_symbolize_keys }

  describe 'GET /api/v1/users/:id' do
    before { get "/api/v1/users/#{user.id}" }

    it { expect(response).to be_success }
    it { expect(response_json).to eq(user: user_json) }
  end

  describe 'GET /api/v1/users/for_name' do
    before { get '/api/v1/users/for_name', name: user.name }

    it { expect(response).to be_success  }
    it { expect(response_json).to eq(user: user_json) }
  end

  describe 'POST /api/v1/users/:id' do
    let(:new_user) {
      {
        email: 'new@email.com',
        name: 'new_name'
      }
    }

    before do
      patch "/api/v1/users/#{user.id}", user: new_user
      user.reload
    end

    it { expect(response).to be_success  }
    it { expect(response_json).to eq(user: user_json) }

    it { expect(user.email).to eq(new_user[:email]) }
    it { expect(user.name).to eq(new_user[:name]) }
  end
end
