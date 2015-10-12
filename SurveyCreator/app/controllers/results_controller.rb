class ResultsController < ApplicationController
  before_action :set_result, only: [:show]

  def show
  end

  def new
    @survey = Survey.find(params[:id])
    @survey.questions.all 
    @questions.answers.build
    @result = survey.results.build
  end

  def create
    @result = Result.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Result was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:survey_id, :index, :new, :create)
    end
end
