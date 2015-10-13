class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
  end

  # GET /responses/new
  def new
    @survey = Survey.find(params[:survey_id])
    @response = @survey.responses.build
    @survey.questions.size.times{@response.answers.build}
  end

  # POST /responses
  # POST /responses.json
  def create
    @survey = Survey.find(params[:survey_id])
    @response = @survey.responses.new(response_params)

    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: 'Response was successfully created.' }
      else
        render :new
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:survey_id, 
        answers_attributes: [:id,:response_id, :answer_content])
    end
end
