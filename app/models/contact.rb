class Contact < ActiveRecord::Base

  # Relationships
  belongs_to :company
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => 'Friendship', :foreign_key => 'friend_id'
  has_many :inverse_friends, :through => :inverse_friendships, :source => :contact

  # Validations
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates_presence_of :first_name, :last_name, :company, :position
  validates_length_of :first_name, :last_name, :position, :maximum => 50
  validates_format_of :email, :with => EMAIL_REGEX, :allow_blank => true
  validates_numericality_of :phone, :allow_blank => true

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
