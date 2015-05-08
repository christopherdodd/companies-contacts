class Contact < ActiveRecord::Base
  belongs_to :company
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => 'Friendship', :foreign_key => 'friend_id'
  has_many :inverse_friends, :through => :inverse_friendships, :source => :contact

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
