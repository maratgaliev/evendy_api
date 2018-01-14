describe Auth::RegistrationsController, type: :request do
  describe 'POST /users/sign_up' do
    before do
      headers = { 'Content-Type' => 'application/json' }

      post '/users/sign_up', headers: headers, params: { user: params }.to_json
    end

    subject { response }

    context 'with removed param' do
      let(:params) { { email: 'email@mail.com', password: 'password', phone: '89033556128'} }

      its(:status) { is_expected.to eq 422 }
      its(:body) { is_expected.to eq '{"errors":{"name":["Не может быть пустым"]}}' }

      it 'should not create user' do
        expect(User.count).to eq 0
      end
    end

    context 'with invalid params' do
      let(:params) { { email: 'email', password: 'password', name: 'name', phone: '89033556128'} }

      its(:status) { is_expected.to eq 422 }
      its(:body) { is_expected.to eq '{"errors":{"email":["Некорректный email"]}}' }

      it 'should not create user' do
        expect(User.count).to eq 0
      end
    end

    context 'with valid params' do
      let(:params) { { email: 'test@test.com', password: 'password', name: 'name', phone: '89033556128'} }

      its(:status) { is_expected.to eq 200 }
      its(:body) { is_expected.to match /user/ }

      it 'should contain authorization header' do
        expect(response.headers['Authorization']).to match /^Bearer/
      end

      describe 'user' do
        subject { User.last }

        its(:email) { is_expected.to eq 'test@test.com' }
        its(:name) { is_expected.to eq 'name'}
      end
    end
  end
end
