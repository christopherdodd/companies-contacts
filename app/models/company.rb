class Company < ActiveRecord::Base

  # Relationships
  has_many :contacts, :dependent => :destroy

  # Validations
  validates_presence_of :name
  validates_length_of :name, :maximum => 50
  validates_uniqueness_of :name

  # CarrierWave
  mount_uploader :image, ImageUploader
end
