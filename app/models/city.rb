# Description: City model that belongs to a state.
class City < ApplicationRecord
  belongs_to :state
end
