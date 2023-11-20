class CreateGpRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :gp_records do |t|
      t.boolean :gp_record_provided
      t.string :pre_index_gp_record_one
      t.string :pre_index_gp_record_two
      t.string :pre_index_gp_record_three
      t.string :pre_index_gp_record_four
      t.string :pre_index_gp_record_five
      t.string :post_index_gp_record_one
      t.string :post_index_gp_record_two
      t.string :post_index_gp_record_three
      t.string :post_index_gp_record_four
      t.string :post_index_gp_record_five
      t.string :pre_accident_hospital_record_one
      t.string :pre_accident_hospital_record_two
      t.string :pre_accident_hospital_record_three
      t.string :pre_accident_hospital_record_four
      t.string :pre_accident_hospital_record_five
      t.string :post_accident_hospital_record_one
      t.string :post_accident_hospital_record_two
      t.string :post_accident_hospital_record_three
      t.string :post_accident_hospital_record_four
      t.string :post_accident_hospital_record_five
      t.string :physio_record_one
      t.string :physio_record_two
      t.string :physio_record_three
      t.string :physio_record_four
      t.string :physio_record_five
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
