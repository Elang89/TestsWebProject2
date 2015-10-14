class SurveysController < ApplicationController

	def index
		@surveys = Survey.all
	end

	def published 
		@surveys = Survey.where(:status => true).order("name DESC")
	end 

	def new
		@survey = Survey.new
		5.times{@survey.questions.build}
	end

	def show
		@survey = Survey.find(params[:id])
	end 

	def edit
		@survey = Survey.find(params[:id])
	end

	def create
	    @survey = current_user.surveys.new(survey_params)
		respond_to do |format|
			if @survey.save
				format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
			else
				format.html { render :new }
			end
		end
	end

	def update
		@survey = Survey.find(params[:id])
	    respond_to do |format|
			if @survey.update(survey_params)
				format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		@survey = Survey.find(params[:id]) 
		@survey.destroy
		respond_to do |format|
			format.html{redirect_to surveys_url, notice: "Survey was successfully destroyed"}
		end 
	end 


	private 

	def set_survey
      	@survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
     def survey_params
      	params.require(:survey).permit(:name, :status, :user_id, 
      		questions_attributes:[:id, :question_content, :survey_id])
    end
end
