require 'rails_helper'

RSpec.describe City, type: :model do
  it 'searches cities by name and state' do
    # Create necessary data
    parana = State.create(name: 'Paraná')
    City.create(name: 'Curitiba', state: parana)

    # Perform search
    result = City.joins(:state).where('states.name = ?', 'Paraná').where('cities.name ILIKE ?', '%Curitiba%')
    expect(result.count).to eq(1)
  end
end
