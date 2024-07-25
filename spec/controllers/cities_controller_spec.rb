require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  describe 'GET index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'filters by state_id' do
      state = State.create(name: 'Paraná')
      city = City.create(name: 'Curitiba', state: state)
      get :index, params: { state_id: state.id }
      expect(assigns(:cities)).to include(city)
    end

    it 'filters by name' do
      state = State.create(name: 'Paraná')
      city = City.create(name: 'Curitiba', state: state)
      get :index, params: { name: 'Curit' }
      expect(assigns(:cities)).to include(city)
    end
  end
end
