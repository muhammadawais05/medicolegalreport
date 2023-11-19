class GpRecord < ApplicationRecord
  belongs_to :patient, inverse_of: :injuries_effect

has_many_attached :pre_index_gp_record_images
end
