class FeatureRequest
  include Mongoid::Document

  field :subject, type: String
  field :description, type: String
  field :votes, type: Integer, default: 0
  field :status, type: String, default: "Open"
end
