class AddAeTestsToTreatments < ActiveRecord::Migration[7.0]
  def change
    add_column :treatments, :ae_tests, :string, array: true, default: []
  end
end
