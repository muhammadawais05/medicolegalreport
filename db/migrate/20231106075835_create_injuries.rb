class CreateInjuries < ActiveRecord::Migration[7.0]
  def change
    create_table :injuries do |t|
      t.string :name
      t.date :started_in
      t.date :resolved_in
      t.boolean :pain_resolved
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
