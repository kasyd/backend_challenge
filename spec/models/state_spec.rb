require 'rails_helper'

RSpec.describe State, type: :model do
  it 'is valid with a name' do
    state = State.new(name: 'Paraná')
    expect(state).to be_valid
  end

  it 'is invalid without a name' do
    state = State.new(name: nil)
    expect(state).not_to be_valid
  end
end
