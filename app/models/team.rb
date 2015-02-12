class Team < ActiveRecord::Base
  attr_accessible :description, :name, :players_attributes, :championship_id, :arms
  belongs_to :championship
  has_many :players
  has_many :user, :through => :players
  accepts_nested_attributes_for :players, :reject_if => lambda { |a| a[:user_id].blank?}, :allow_destroy => true
  mount_uploader :arms,  ImageUploader
  validates :name, presence: true
  validates :name, :uniqueness => true


  end
