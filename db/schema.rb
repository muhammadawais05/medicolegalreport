# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_07_141925) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accidents", force: :cascade do |t|
    t.date "date"
    t.integer "vehicle"
    t.boolean "seat_belted"
    t.integer "accident_victim"
    t.integer "travelling_speed"
    t.integer "vehicle_category"
    t.string "approximate_speed"
    t.integer "site_of_accident"
    t.boolean "air_bag_deployed"
    t.boolean "jolted_fwd_or_bwd"
    t.integer "third_party_vehicle"
    t.boolean "hit_the_car_interior"
    t.string "body_hit_vehicle_part"
    t.integer "state_after_accident"
    t.integer "accident_scene_attendees"
    t.string "third_party_vehicle_speed"
    t.integer "where_were_you_looking_at"
    t.boolean "able_to_exit_your_vehicle_unaided"
    t.boolean "vehicle_fitted_with_head_restraint"
    t.string "description_of_nonroad_traffice_accident"
    t.string "mechanisms_of_injury", default: [], array: true
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_accidents_on_patient_id"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.date "date"
    t.integer "solicitors_ref"
    t.integer "identity_proof"
    t.string "examination_venue"
    t.boolean "any_time_off_work"
    t.string "report_requested_by"
    t.string "other_identity_proof"
    t.integer "visit_after_accident"
    t.string "other_hospital_visited_after_accident"
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_user_id", null: false
    t.index ["admin_user_id"], name: "index_appointments_on_admin_user_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "clinical_examinations", force: :cascade do |t|
    t.boolean "neck_spasm"
    t.boolean "neck_scars"
    t.boolean "neck_crepitus"
    t.boolean "neck_reflexes"
    t.boolean "neck_sensations"
    t.boolean "neck_deformities"
    t.boolean "back_slr"
    t.boolean "back_spasm"
    t.boolean "back_scars"
    t.boolean "back_reflexes"
    t.boolean "back_sensations"
    t.boolean "back_deformities"
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "other_joint_examination"
    t.index ["patient_id"], name: "index_clinical_examinations_on_patient_id"
  end

  create_table "gp_records", force: :cascade do |t|
    t.boolean "gp_record_provided"
    t.string "pre_index_gp_record_one"
    t.string "pre_index_gp_record_two"
    t.string "pre_index_gp_record_three"
    t.string "pre_index_gp_record_four"
    t.string "pre_index_gp_record_five"
    t.string "post_index_gp_record_one"
    t.string "post_index_gp_record_two"
    t.string "post_index_gp_record_three"
    t.string "post_index_gp_record_four"
    t.string "post_index_gp_record_five"
    t.string "pre_accident_hospital_record_one"
    t.string "pre_accident_hospital_record_two"
    t.string "pre_accident_hospital_record_three"
    t.string "pre_accident_hospital_record_four"
    t.string "pre_accident_hospital_record_five"
    t.string "post_accident_hospital_record_one"
    t.string "post_accident_hospital_record_two"
    t.string "post_accident_hospital_record_three"
    t.string "post_accident_hospital_record_four"
    t.string "post_accident_hospital_record_five"
    t.string "physio_record_one"
    t.string "physio_record_two"
    t.string "physio_record_three"
    t.string "physio_record_four"
    t.string "physio_record_five"
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_gp_records_on_patient_id"
  end

  create_table "injuries", force: :cascade do |t|
    t.string "injury_one_name"
    t.string "injury_one_started_in"
    t.string "injury_one_resolved_in"
    t.boolean "injury_one_pain_resolved"
    t.string "injury_two_name"
    t.string "injury_two_started_in"
    t.string "injury_two_resolved_in"
    t.boolean "injury_two_pain_resolved"
    t.string "injury_three_name"
    t.string "injury_three_started_in"
    t.string "injury_three_resolved_in"
    t.boolean "injury_three_pain_resolved"
    t.string "injury_four_name"
    t.string "injury_four_started_in"
    t.string "injury_four_resolved_in"
    t.boolean "injury_four_pain_resolved"
    t.string "injury_five_name"
    t.string "injury_five_started_in"
    t.string "injury_five_resolved_in"
    t.boolean "injury_five_pain_resolved"
    t.string "injury_six_name"
    t.string "injury_six_started_in"
    t.string "injury_six_resolved_in"
    t.boolean "injury_six_pain_resolved"
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pain_before_accident_one", default: 0
    t.integer "pain_after_accident_one", default: 0
    t.integer "accident_one_pain_now", default: 0
    t.integer "pain_before_accident_two", default: 0
    t.integer "pain_after_accident_two", default: 0
    t.integer "accident_two_pain_now", default: 0
    t.integer "pain_before_accident_three", default: 0
    t.integer "pain_after_accident_three", default: 0
    t.integer "accident_three_pain_now", default: 0
    t.integer "pain_before_accident_four", default: 0
    t.integer "pain_after_accident_four", default: 0
    t.integer "accident_four_pain_now", default: 0
    t.integer "pain_before_accident_five", default: 0
    t.integer "pain_after_accident_five", default: 0
    t.integer "accident_five_pain_now", default: 0
    t.integer "pain_before_accident_six", default: 0
    t.integer "pain_after_accident_six", default: 0
    t.integer "accident_six_pain_now", default: 0
    t.index ["patient_id"], name: "index_injuries_on_patient_id"
  end

  create_table "injuries_effects", force: :cascade do |t|
    t.boolean "phased_return"
    t.boolean "had_counseling"
    t.boolean "taken_holidays"
    t.string "total_holidays"
    t.string "injury_comments"
    t.boolean "returned_to_work"
    t.boolean "difficulty_resolved"
    t.boolean "need_any_assistance"
    t.string "details_of_assistance"
    t.string "difficulty_resolved_in"
    t.string "further_injury_details"
    t.boolean "returned_to_activities"
    t.boolean "any_difficulty_at_work"
    t.integer "psychological_symptoms"
    t.boolean "suffer_sleeping_problem"
    t.string "difficulty_in_activities"
    t.string "how_long_sleeping_problem"
    t.boolean "any_work_adaption_for_pain"
    t.boolean "wish_to_provide_futher_info"
    t.boolean "activities_limited_by_symptoms"
    t.string "activities_restricted_by_injury"
    t.boolean "any_difficulty_with_house_work"
    t.boolean "suffered_psychological_sysptoms"
    t.boolean "psychological_symptoms_resolved"
    t.string "difficulties_at_home", default: [], array: true
    t.string "difficulties_at_work", default: [], array: true
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_injuries_effects_on_patient_id"
  end

  create_table "medical_histories", force: :cascade do |t|
    t.string "type_a_pain"
    t.string "similar_injuries"
    t.string "past_road_accident"
    t.boolean "claim_the_injuries"
    t.string "what_increases_pain"
    t.string "had_injection_for_pain"
    t.string "has_operation_for_pain"
    t.string "previous_medical_condition"
    t.boolean "body_pain_before_accident"
    t.string "history_additional_details"
    t.boolean "past_similar_road_accident"
    t.string "had_physiothereapy_for_pain"
    t.string "body_parts_pain_before_this_accident"
    t.boolean "similar_injuries_since_index_accident"
    t.string "which_painkiller_is_comsuming_before_accident"
    t.boolean "accident_flared_up_previous_medical_condition"
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_medical_histories_on_patient_id"
  end

  create_table "opinions", force: :cascade do |t|
    t.boolean "severity_of_injuries"
    t.string "diagnosis_and_causation"
    t.boolean "complications_in_future"
    t.boolean "suffered_inconviniences"
    t.boolean "claimant_life_expentancy"
    t.boolean "accident_since_index_accident"
    t.boolean "consequences_of_physical_injuries"
    t.boolean "impact_of_previous_medical_history"
    t.boolean "effect_of_injurt_on_claimants_work_reasonable"
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_opinions_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "dob"
    t.string "city"
    t.string "email"
    t.string "state"
    t.string "sur_name"
    t.string "form_link"
    t.string "first_name"
    t.string "ocuupation"
    t.string "postal_code"
    t.string "phone_number"
    t.boolean "suffering_fever"
    t.boolean "suffering_cough"
    t.boolean "shortness_of_breath"
    t.boolean "loss_of_taste_or_smell"
    t.integer "form_status", default: 0
    t.boolean "persistant_pain_in_chest"
    t.boolean "travelled_abroad_during_2022"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_user_id"
    t.string "holidays_from_work"
    t.index ["admin_user_id"], name: "index_patients_on_admin_user_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.integer "ae_test"
    t.integer "exercise"
    t.boolean "went_to_ae"
    t.string "painkillers"
    t.string "hospital_name"
    t.integer "admitted_days"
    t.string "attendance_date"
    t.integer "total_sessions"
    t.string "symptom_comments"
    t.string "no_gp_visit_reason"
    t.boolean "symptom_imporoved"
    t.string "treatment_comments"
    t.boolean "need_any_operation"
    t.boolean "date_of_attendance"
    t.string "physiotherapist_data"
    t.boolean "treatment_completed"
    t.boolean "utilizing_painkiller"
    t.boolean "admitted_to_hospital"
    t.integer "further_visits_count"
    t.boolean "painkiller_prescribed"
    t.string "treatment_relevant_data"
    t.string "other_mode_of_transport"
    t.boolean "gp_visit_after_accident"
    t.date "first_visit_after_accident"
    t.boolean "mode_of_transport_to_ae"
    t.string "treatment_additional_details_expert_use"
    t.string "treatment_additional_details_expert_view"
    t.string "gp_arrangements", default: [], array: true
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ae_tests", default: [], array: true
    t.index ["patient_id"], name: "index_treatments_on_patient_id"
  end

  add_foreign_key "accidents", "patients"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "admin_users"
  add_foreign_key "appointments", "patients"
  add_foreign_key "clinical_examinations", "patients"
  add_foreign_key "gp_records", "patients"
  add_foreign_key "injuries", "patients"
  add_foreign_key "injuries_effects", "patients"
  add_foreign_key "medical_histories", "patients"
  add_foreign_key "opinions", "patients"
  add_foreign_key "patients", "admin_users"
  add_foreign_key "treatments", "patients"
end
