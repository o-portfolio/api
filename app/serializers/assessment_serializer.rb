class AssessmentSerializer < ActiveModel::Serializer
  attributes :id, :trainee_id, :date, :assessor_name, :assessor_position, :assessor_email, :clinical_setting, :clinical_problem_categories, :focus_of_encounter, :case_summary, :positive_areas, :development_areas, :comments

end
