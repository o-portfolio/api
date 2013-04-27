require 'spec_helper'

describe '/assessments' do

  describe "GET /" do
    it "should require auth" do
      get '/assessments'
      response.code.should == '401'
    end

    it "should render assessments" do
      user = http_login
      assessment = create :mini_cex_assessment, trainee: user
      get '/assessments', {}, @env
      response.body.should == "{\"assessments\":[{\"id\":1,\"trainee_id\":1,\"date\":\"2013-01-02T03:04:05Z\",\"assessor_name\":\"Jeremy Walker\",\"assessor_position\":\"King of World\",\"assessor_email\":\"jez.walker@mgmail.com\",\"clinical_setting\":\"ward\",\"clinical_problem_categories\":\"---\\n- breathing\\n- circulation\\n\",\"focus_of_encounter\":\"discharge\",\"case_summary\":\"lorem ipsum\",\"positive_areas\":\"lorem ipsum\",\"development_areas\":\"lorem ipsum\",\"comments\":\"lorem ipsum\"}]}"
    end
  end

  describe "GET /:id" do
    it "should require auth" do
      get '/assessments/1'
      response.code.should == '401'
    end

    it "should render assessment" do
      user = http_login
      assessment = create :mini_cex_assessment, trainee: user
      get "/assessments/#{assessment.id}", {}, @env
      response.body.should == "{\"assessment\":{\"id\":1,\"trainee_id\":1,\"date\":\"2013-01-02T03:04:05Z\",\"assessor_name\":\"Jeremy Walker\",\"assessor_position\":\"King of World\",\"assessor_email\":\"jez.walker@mgmail.com\",\"clinical_setting\":\"ward\",\"clinical_problem_categories\":\"---\\n- breathing\\n- circulation\\n\",\"focus_of_encounter\":\"discharge\",\"case_summary\":\"lorem ipsum\",\"positive_areas\":\"lorem ipsum\",\"development_areas\":\"lorem ipsum\",\"comments\":\"lorem ipsum\"}}"
    end
  end

  describe "POST /" do
    
    it "should require auth" do
      post '/assessments'
      response.code.should == '401'
    end

    it "should return errors with incorrect data" do
      user = http_login
      post "/assessments/", {}, @env
      response.code.should == "422"
      response.body.should == "{\"errors\":{\"date\":[\"can't be blank\"]}}"
    end

    it "should create with correct data" do

      pending "Should this post to /mini_cex_assessments or should we pass in type?"

      user = http_login
      post "/assessments/", {date: DateTime.now}, @env
      assessment = Assessment.last

      response.code.should == "200"
      response.body.should == "{\"assessment\":{\"id\":#{assessment.id},\"title\":\"FTW!!\",\"description\":null,\"reflection\":null,\"occurred_at\":null,\"image_latitude\":null,\"image_longitude\":null,\"created_at\":\"#{assessment.created_at.xmlschema}\",\"image_url\":null}}"
    end
  end
  
  describe "PUT /:id" do
    
    it "should require auth" do
      put '/assessments/1'
      response.code.should == '401'
    end

    it "should return errors with incorrect data" do
      user = http_login
      assessment = create :mini_cex_assessment, trainee: user
      put "/assessments/1", {date: nil}, @env
      response.code.should == "422"
      response.body.should == "{\"errors\":{\"date\":[\"can't be blank\"]}}"
    end

    it "should create with correct data" do
      user = http_login
      assessment = create :mini_cex_assessment, trainee: user
      put "/assessments/1", {title: "FTW!!"}, @env

      response.code.should == "200"
      response.body.should == "{\"assessment\":{\"id\":1,\"trainee_id\":1,\"date\":\"2013-01-02T03:04:05Z\",\"assessor_name\":\"Jeremy Walker\",\"assessor_position\":\"King of World\",\"assessor_email\":\"jez.walker@mgmail.com\",\"clinical_setting\":\"ward\",\"clinical_problem_categories\":\"---\\n- breathing\\n- circulation\\n\",\"focus_of_encounter\":\"discharge\",\"case_summary\":\"lorem ipsum\",\"positive_areas\":\"lorem ipsum\",\"development_areas\":\"lorem ipsum\",\"comments\":\"lorem ipsum\"}}"
    end
  end
end
