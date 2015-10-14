class ResultsController < ApplicationController
	before_action :set_result, only: [:show]

  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
  	@survey = Survey.find(params[:survey_id])
  	@result = @survey.results.find(params[:id])
  end

  # GET /results/new
  def new
    @survey = Survey.find(params[:survey_id])
    @result = @survey.results.build
    @survey.questions.size.times{@result.answers.build}
  end

  # POST /results
  # POST /results.json
  def create
    @survey = Survey.find(params[:survey_id])
    @result = @survey.results.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to survey_result_path(@survey, @result), notice: 'result was successfully created.' }
      else
        format.html {render :new}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:survey_id, 
      	answers_attributes: [:id,:result_id, :question_id, :answer_content])
    end
end
