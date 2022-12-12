# frozen_string_literal: true

RSpec.describe User, type: :request do
  before(:each) do
    @user = create(:user)
    sign_in @user
    @car = create(:car)
  end

  describe 'delete User' do
    it 'Deberia disminuir en 1 la cantidad de usuarios' do
      expect do
        delete usuarios_delete_path(id_usuario: @user.id, car_id: @car.id)
      end.to change(User, :count).by(-1)
    end
  end
end
