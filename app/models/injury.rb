class Injury < ApplicationRecord
  belongs_to :patient, inverse_of: :injury

end
