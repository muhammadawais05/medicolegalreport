class CreateAccidents < ActiveRecord::Migration[7.0]
  def change
    create_table :accidents do |t|
      t.date :date
      t.integer :vehicle
      t.boolean :seat_belted
      t.integer :accident_victim
      t.integer :travelling_speed
      t.integer :vehicle_category
      t.string :approximate_speed
      t.integer :site_of_accident
      t.boolean :air_bag_deployed
      t.boolean :jolted_fwd_or_bwd
      t.integer :third_party_vehicle
      t.boolean :hit_the_car_interior
      t.string :body_hit_vehicle_part
      t.integer :state_after_accident
      t.integer :accident_scene_attendees
      t.string :third_party_vehicle_speed
      t.integer :where_were_you_looking_at
      t.boolean :able_to_exit_your_vehicle_unaided
      t.boolean :vehicle_fitted_with_head_restraint
      t.string :description_of_nonroad_traffice_accident
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
