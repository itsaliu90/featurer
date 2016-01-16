namespace :feature_requests_model_migration do
  desc "Related to migrations"
  
  task add_status_field: :environment do
  	FeatureRequest.update_all(status: "Open")
  end

end
