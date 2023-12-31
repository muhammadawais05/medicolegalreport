class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :dob
      t.string :city
      t.string :email
      t.string :state
      t.string :sur_name
      t.string :form_link
      t.string :first_name
      t.string :ocuupation
      t.string :postal_code
      t.string :phone_number
      t.boolean :suffering_fever
      t.boolean :suffering_cough
      t.boolean :shortness_of_breath
      t.boolean :loss_of_taste_or_smell
      t.integer :form_status, default: 0
      t.boolean :persistant_pain_in_chest
      t.boolean :travelled_abroad_during_2022

      t.timestamps
    end
  end
end
