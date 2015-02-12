class Championship < ActiveRecord::Base
  attr_accessible :description, :logo, :name, :team_id, :user_id, :teams_attributes
  has_many :teams
  belongs_to :user
  accepts_nested_attributes_for :teams, :reject_if => lambda { |a| a[:name].blank?}, :allow_destroy => true
  mount_uploader :logo,  ImageUploader
end
