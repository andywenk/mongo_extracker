class ExTracker
  include Mongoid::Document

  field :name, type: String
  field :occurence, type: String
  field :message, type: String
  field :created_at, type: DateTime
end
