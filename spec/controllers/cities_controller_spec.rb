require 'rails_helper'

RSpec.describe CitiesController, type: :controller do # rubocop:disable Metrics/BlockLength
  let!(:parana) { State.create(name: 'Paraná', uf: 'PR') }
  let!(:santa_catarina) { State.create(name: 'Santa Catarina', uf: 'SC') }
  let!(:rio_grande_do_sul) { State.create(name: 'Rio Grande do Sul', uf: 'RS') }

  let!(:curitiba) { City.create(name: 'Curitiba', state: parana) }
  let!(:londrina) { City.create(name: 'Londrina', state: parana) }
  let!(:florianopolis) { City.create(name: 'Florianópolis', state: santa_catarina) }
  let!(:porto_alegre) { City.create(name: 'Porto Alegre', state: rio_grande_do_sul) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'filters cities by state_id' do
      get :index, params: { state_id: parana.id }
      expect(assigns(:cities)).to include(curitiba, londrina)
      expect(assigns(:cities)).not_to include(florianopolis, porto_alegre)
    end

    it 'filters cities by name' do
      get :index, params: { name: 'Curitiba' }
      expect(assigns(:cities)).to include(curitiba)
      expect(assigns(:cities)).not_to include(londrina, florianopolis, porto_alegre)
    end

    it 'filters cities by partial name' do
      get :index, params: { name: 'Curi' }
      expect(assigns(:cities)).to include(curitiba)
      expect(assigns(:cities)).not_to include(londrina, florianopolis, porto_alegre)
    end

    it 'filters cities by state_id and partial name' do
      get :index, params: { state_id: parana.id, name: 'Curi' }
      expect(assigns(:cities)).to include(curitiba)
      expect(assigns(:cities)).not_to include(londrina, florianopolis, porto_alegre)
    end
  end
end
