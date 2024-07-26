require 'rails_helper'

RSpec.describe 'Cities', type: :request do # rubocop:disable Metrics/BlockLength
  let!(:parana) { State.create(name: 'Paraná') }
  let!(:curitiba) { City.create(name: 'Curitiba', state: parana) }
  let!(:londrina) { City.create(name: 'Londrina', state: parana) }

  describe 'GET /cities' do
    it 'returns a success response' do
      get cities_path, headers: { 'ACCEPT' => 'application/json' }
      expect(response).to be_successful
    end

    it 'returns cities by state' do
      get cities_path, params: { state_id: parana.id }, headers: { 'ACCEPT' => 'application/json' }
      expect(response).to be_successful
      json = JSON.parse(response.body)
      expect(json.map { |c| c['name'] }).to include('Curitiba', 'Londrina')
    end

    it 'returns cities by partial name' do
      get cities_path, params: { name: 'Curit' }, headers: { 'ACCEPT' => 'application/json' }
      expect(response).to be_successful
      json = JSON.parse(response.body)
      expect(json.map { |c| c['name'] }).to include('Curitiba')
      expect(json.map { |c| c['name'] }).not_to include('Londrina')
    end

    it 'returns cities by state and partial name' do
      get cities_path, params: { state_id: parana.id, name: 'Curit' }, headers: { 'ACCEPT' => 'application/json' }
      expect(response).to be_successful
      json = JSON.parse(response.body)
      expect(json.map { |c| c['name'] }).to include('Curitiba')
      expect(json.map { |c| c['name'] }).not_to include('Londrina')
    end
  end
end
