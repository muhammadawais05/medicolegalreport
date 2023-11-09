class InjuriesEffect < ApplicationRecord
  belongs_to :patient, inverse_of: :injuries_effect

  DIFICULTIES_AT_HOME = ['Vacuuming', 'Mopping', 'Making bed', 'Lifting Personal hygeine'].freeze
  DIFICULTIES_AT_WORK = ['Pain', 'Could not lift', 'could not type', 'could not concentrate'].freeze


  enum psychological_symptoms: { anxiety: 0, depression: 1, frustation: 2 }
end
