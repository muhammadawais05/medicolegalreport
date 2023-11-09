class Patient < ApplicationRecord
  belongs_to :admin_user
  validates_presence_of :email, :first_name, :sur_name
  enum form_status: { pending: 0, sent: 1, filled: 2}
end
