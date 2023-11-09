class Opinion < ApplicationRecord
  belongs_to :patient, inverse_of: :opinion

end
