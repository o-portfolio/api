require 'spec_helper'

describe '/entries' do

  describe "GET /" do
    
    it "should require auth" do
      get '/entries'
      response.code.should == '401'
    end

    it "should render entries" do
      user = http_login
      entry = create :entry, user: user
      get '/entries', {}, @env
      response.body.should == "{\"entries\":[{\"id\":#{entry.id},\"title\":\"Foobar\",\"description\":\"Some description\",\"reflection\":\"Some reflection\",\"occurred_at\":\"2013-01-02T03:04:05Z\",\"image_latitude\":\"100.0\",\"image_longitude\":\"200.0\",\"created_at\":\"#{entry.created_at.xmlschema}\",\"image_url\":null}]}"
    end
  end

  describe "GET /:id" do
    it "should require auth" do
      get '/entries/1'
      response.code.should == '401'
    end

    it "should render entry" do
      user = http_login
      entry = create :entry, user: user
      get "/entries/#{entry.id}", {}, @env
      response.body.should == "{\"entry\":{\"id\":#{entry.id},\"title\":\"Foobar\",\"description\":\"Some description\",\"reflection\":\"Some reflection\",\"occurred_at\":\"2013-01-02T03:04:05Z\",\"image_latitude\":\"100.0\",\"image_longitude\":\"200.0\",\"created_at\":\"#{entry.created_at.xmlschema}\",\"image_url\":null}}"
    end
  end

  describe "POST /" do
    
    it "should require auth" do
      post '/entries'
      response.code.should == '401'
    end

    it "should return errors with incorrect data" do
      user = http_login
      post "/entries/", {}, @env
      response.code.should == "422"
      response.body.should == "{\"errors\":{\"title\":[\"can't be blank\"]}}"
    end

    it "should create with correct data" do
      user = http_login
      post "/entries/", {title: "FTW!!"}, @env
      entry = Entry.last

      response.code.should == "200"
      response.body.should == "{\"entry\":{\"id\":#{entry.id},\"title\":\"FTW!!\",\"description\":null,\"reflection\":null,\"occurred_at\":null,\"image_latitude\":null,\"image_longitude\":null,\"created_at\":\"#{entry.created_at.xmlschema}\",\"image_url\":null}}"
    end
  end
  
  describe "PUT /:id" do
    
    it "should require auth" do
      put '/entries/1'
      response.code.should == '401'
    end

    it "should return errors with incorrect data" do
      user = http_login
      entry = create :entry, user: user
      put "/entries/1", {title: nil}, @env
      response.code.should == "422"
      response.body.should == "{\"errors\":{\"title\":[\"can't be blank\"]}}"
    end

    it "should create with correct data" do
      user = http_login
      entry = create :entry, user: user
      put "/entries/1", {title: "FTW!!"}, @env

      response.code.should == "200"
      response.body.should == "{\"entry\":{\"id\":#{entry.id},\"title\":\"FTW!!\",\"description\":\"Some description\",\"reflection\":\"Some reflection\",\"occurred_at\":\"2013-01-02T03:04:05Z\",\"image_latitude\":\"100.0\",\"image_longitude\":\"200.0\",\"created_at\":\"#{entry.created_at.xmlschema}\",\"image_url\":null}}"
    end
  end
end
