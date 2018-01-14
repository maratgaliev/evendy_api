describe Users::SignUpCommand do
  
  let(:command) { described_class.new }

  context 'email error' do
    it 'invalid format' do
      result = command.call(email: 'email', password: 'password', name: 'name', phone: '89033556128')

      expect(result.failure?).to be_truthy
      expect(result.value).to eq(email: ['Некорректный email'])
    end

    it 'email already exists' do
      user = FactoryBot.create(:user)

      result = command.call(email: user.email, password: 'password', name: 'name', phone: '89033556128')

      expect(result.failure?).to be_truthy
      expect(result.value).to eq(email: ['уже существует'])
    end
  end

  context 'password error' do
    it 'invalid format' do
      result = command.call(email: 'test@test.com', password: 'pass', name: 'name', phone: '89033556128')

      expect(result.failure?).to be_truthy
      expect(result.value).to eq(password: ['Минимум 6 символов'])
    end
  end

  context 'success save' do
    let(:result) { command.call(email: 'test@test.com', password: 'password', name: 'name', phone: '89033556128') }

    subject { result }

    its(:success?) { is_expected.to be_truthy }

    describe 'user' do
      subject { result.value }

      its(:persisted?) { is_expected.to be_truthy }
      its(:email) { is_expected.to eq 'test@test.com' }
      its(:name) { is_expected.to eq 'name' }
    end
  end
end
