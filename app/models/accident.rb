class Accident < ApplicationRecord
  belongs_to :patient, inverse_of: :accident

  MECHANISMS_OF_INJURY = ['Car Accident', 'Motorbike Accident', 'Injury at work', 'Injury at Public place', 'Pushbike accident', 'Pedestrian'].freeze

  enum vehicle: { car: 0, Van: 1, lorry: 2, hgv: 3 }
  enum travelling_speed: { stationary: 0, moving: 1 }
  enum state_after_accident: { shocked: 0,  dizzy: 1, unconcious: 2 }
  enum vehicle_category: { repaired: 0, written_off: 1, not_damaged: 2 }
  enum site_of_accident: { traffic_light: 0, round_about: 1, road_junction: 2 }
  enum accident_scene_attendees: { police: 0, ambulance: 1, fire_engine: 2, no_one: 3 }
  enum where_were_you_looking_at: { staight_ahead: 0, downwards: 1, left: 2, right: 3 }
  enum accident_victim: { driver: 0, front_seat_passenger: 1, back_seat_passenger: 2, pedestrian: 3 }
  enum third_party_vehicle: { third_party_car: 0, third_party_Van: 1, third_party_lorry: 2, third_party_hgv: 3 }
end
