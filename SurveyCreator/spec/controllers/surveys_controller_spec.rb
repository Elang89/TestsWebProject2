require 'rails_helper'
require 'spec_helper'

describe SurveysController, type: :controller do

  	let(:valid_attributes){
		@user = User.create!(:email => "email@gmail.com", :password => 'password')
	  		{:name => "name",:status => false, :user_id => @user.id}
  	} 

  	let(:invalid_attributes){
  		@user = User.create!(:email => "email@gmail.com", :password => 'password')
	  		{:name => "", :status => false, :user_id => @user.id}	
  	}

	describe "GET #index" do
		it "shows a list of available surveys in the database" do
			survey = Survey.create! valid_attributes
		  	get :index
		  	expect(assigns(:surveys)).to eq([survey])
		end

		it "renders the html template for the survey index" do 
			get :index
			expect(response).to render_template('index')
		end 
	end

	describe "GET #new" do
		it "creates a new survey object" do
			survey = Survey.create! valid_attributes
			get :new 
			expect(assigns(:survey)).to be_a_new(Survey)
			expect(assigns(:survey).questions.size).to eq(5)
		end

		it "renders the template for a new survey" do 
			get :new 
			expect(response).to render_template("new")
		end 
	end

	describe "GET #show" do 
	  	it "retrieves a specific survey from the database" do 
	  		survey = Survey.create! valid_attributes
	  		get :show, id: survey
	  		expect(assigns(:survey)).to eq(survey)
	  	end 

	  	it "renders the specific survey" do 
	  		survey = Survey.create! valid_attributes
	  		get :show, id: survey 
	  		expect(response).to render_template('show')
	  	end
	end

	describe "GET #edit" do 
		it "retrieves the specified survey from the database" do 
			survey = Survey.create! valid_attributes 
			get :edit, id: survey 
			expect(assigns(:survey)).to eq(survey)
		end

		it "renders the edit template for the specific survey" do 
	  		survey = Survey.create! valid_attributes
	  		get :show, id: survey 
	  		expect(response).to render_template('show')
		end 
	end

	describe "POST #create" do 
		before(:each) do 
			@user = User.create!(email: "email@gmail.com", password: "password")
			sign_in @user
		end 
		context "with valid attributes" do 	
			it "describes a survey created with valid attributes" do
				expect{
					post :create, survey: {name: "Name", user_id: @user.id}
				}.to change(Survey, :count).by(1)
			end

			it "redirects the user to the survey's detail page" do
				post :create, survey: {name: "Name", user_id: @user.id}
				expect(response).to redirect_to(Survey.last)
			end 
		end

		context "with invalid attributes" do 
			it "describes a survey created with invalid attributes" do 
				expect{
					post :create, survey: {name: "", user_id: @user.id}
				}.not_to change(Survey,:count)
			end

			it "re-renders the new template" do 
				post :create, survey: {name: "", user_id: @user.id}
				expect(response).to render_template('new')
			end 
		end 
	end 
	describe "PUT #update" do

		let (:new_attributes){
			{:name => "Another Name"}
		}

		let (:invalid_new_attributes){
			{:name => ""}
		}

		context "with valid attributes" do 
			it "changes the requested survey" do 
				survey = Survey.create! valid_attributes
				put  :update, {id: survey.to_param, survey: new_attributes}
				survey.reload
				expect(controller.notice).to eq("Survey was successfully updated.")
			end 

			it "assigns the requested survey as @survey" do
				survey = Survey.create! valid_attributes
				put  :update, {id: survey.to_param, survey: valid_attributes}
				expect(assigns(:survey)).to eq(survey)
			end 

			it "redirects to the updated survey" do 
				survey = Survey.create! valid_attributes
				put  :update, {id: survey.to_param, survey: valid_attributes}
				expect(response).to redirect_to(survey)
			end 
		end 

		context "with invalid attributes" do 
			it "changes the survey with invalid attributes" do 
				survey = Survey.create! valid_attributes
				put :update, {id: survey.to_param, survey: invalid_new_attributes}
				expect(assigns(:survey)).to eq(survey)
			end

			it "re-renders the edit template" do 
				survey = Survey.create! valid_attributes
				put :update, {id: survey.to_param, survey: invalid_new_attributes}
				expect(response).to render_template('edit')
			end   
		end
	end 

	describe "DELETE #destroy" do 
		it "deletes the specified survey" do
			survey = Survey.create! valid_attributes 
			expect {
				delete :destroy, id: survey
			}.to change(Survey,:count).by(-1)
		end 

		it "redirects to the surveys#index" do 
			survey = Survey.create! valid_attributes
			delete :destroy, id: survey
			expect(response).to redirect_to(surveys_url)
		end  
	end
end  	
