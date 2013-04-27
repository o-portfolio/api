class AssessmentsController < ApplicationController
  
  def index
    @assessments = @current_user.assessments
    render json: @assessments
  end
  
  def show
    @assessment = @current_user.assessments.find(params[:id])
    render json: @assessment, root: 'assessment'
  end
  
  def create
    @assessment = @current_user.assessments.build(assessment_params)
    if @assessment.save
      render json: @assessment, status: 200
    else
       render json: {errors: @assessment.errors}, status: 422
    end
  end
  
  def update
    @assessment = @current_user.assessments.find(params[:id])
    if @assessment.update_attributes(assessment_params)
      render json: @assessment, status: 200, root: 'assessment'
    else
      render json: {errors: @assessment.errors}, status: 422
    end
  end
  
  def destroy
    @assessment = @current_user.assessments.find(params[:id])
    @assessment.destroy
  end

  private

    def assessment_params
      params.slice(:date, :assessor_name, :assessor_position, :assessor_email, :clinical_setting, :clinical_problem_categories, :focus_of_encounter, :case_summary, :positive_areas, :development_areas, :comments)
    end

end

