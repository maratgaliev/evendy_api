describe UsersController, type: :request do

  let!(:user) { FactoryBot.create(:user) }

  let(:token) { Warden::JWTAuth::UserEncoder.new.call(user, :user) }

  let(:auth_headers) do
    {
      'Content-Type' => 'application/json',
      'Authorization' => "Bearer #{token}"
    }
  end

  subject { response }

  describe 'GET /users/:id' do
    context 'empty JWT token' do
      before { get "/users/#{user.id}", headers: { 'Content-Type' => 'application/json' } }
      its(:status) { is_expected.to eq 200 }
    end

    context 'with JWT token' do
      let(:user) { FactoryBot.create(:user) }

      before { get "/users/#{user.id}", headers: auth_headers }

      its(:status) { is_expected.to eq 200 }

      describe 'response JSON' do
        let(:json_response) { JSON.parse(response.body) }

        it 'should contain user' do
          expect(json_response.key?('user')).to eq true
          expect(json_response['user']['id']).to eq user.id
        end
      end
    end
  end
end

