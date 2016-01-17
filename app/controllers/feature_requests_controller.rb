class FeatureRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_feature_request, only: [:show, :edit, :update, :destroy, :upvote, :close]

  def upvote
    if current_user.votes > 0
      @feature_request.inc(votes: 1)
      current_user.inc(votes: -1)
      redirect_to feature_requests_url
    else
      redirect_to root_url, flash: { notice: "You don't have enough votes" }
    end
  end

  def close
    @feature_request.update(status: 'Closed')
    redirect_to admin_url
  end

  # GET /feature_requests
  # GET /feature_requests.json
  def index
    @open_feature_requests = FeatureRequest.where(status: "Open").order_by(votes: 'desc')
    @in_progress_feature_requests = FeatureRequest.where(status: "In Progress")
  end

  # GET /feature_requests/1
  # GET /feature_requests/1.json
  def show
  end

  # GET /feature_requests/new
  def new
    @feature_request = FeatureRequest.new
  end

  # GET /feature_requests/1/edit
  def edit
  end

  # POST /feature_requests
  # POST /feature_requests.json
  def create
    binding.pry
    @feature_request = FeatureRequest.new(feature_request_params)
    @feature_request.update(user_id: current_user._id)
    respond_to do |format|
      if @feature_request.save
        format.html { redirect_to @feature_request, notice: 'Feature request was successfully created.' }
        format.json { render :show, status: :created, location: @feature_request }
      else
        format.html { render :new }
        format.json { render json: @feature_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feature_requests/1
  # PATCH/PUT /feature_requests/1.json
  def update
    respond_to do |format|
      if @feature_request.update(feature_request_params)
        format.html { redirect_to @feature_request, notice: 'Feature request was successfully updated.' }
        format.json { render :show, status: :ok, location: @feature_request }
      else
        format.html { render :edit }
        format.json { render json: @feature_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feature_requests/1
  # DELETE /feature_requests/1.json
  def destroy
    @feature_request.destroy
    respond_to do |format|
      format.html { redirect_to feature_requests_url, notice: 'Feature request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature_request
      @feature_request = FeatureRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feature_request_params
      params[:feature_request].permit(:subject, :description, :status)
    end
end
