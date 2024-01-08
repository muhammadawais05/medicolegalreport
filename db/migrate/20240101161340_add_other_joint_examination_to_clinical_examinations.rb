class AddOtherJointExaminationToClinicalExaminations < ActiveRecord::Migration[7.0]
  def change
    add_column :clinical_examinations, :other_joint_examination, :string
  end
end
