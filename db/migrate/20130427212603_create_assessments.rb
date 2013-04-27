class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :type, null: false

      t.integer :trainee_id, null: false
      
      t.datetime :date, null: false
      t.string :assessor_name
      t.string :assessor_position
      t.string :assessor_email
      t.string :clinical_setting
      t.string :clinical_problem_categories
      t.string :focus_of_encounter
      t.text :case_summary
      t.text :positive_areas
      t.text :development_areas
      t.text :comments
      t.timestamps
    end
  end
end
