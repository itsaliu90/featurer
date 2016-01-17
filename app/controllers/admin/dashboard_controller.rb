class Admin::DashboardController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
  	@open_feature_requests = FeatureRequest.where(status: "Open").order_by(votes: 'desc')
  end
end
