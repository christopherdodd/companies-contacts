class Friendship < ActiveRecord::Base

  # Relationships
  belongs_to :contact
  belongs_to :friend, :class_name => 'Contact'

  # Validations
  validates_uniqueness_of :contact_id, :scope => :friend_id
  validates_uniqueness_of :friend_id, :scope => :contact_id # Validate uniqueness of combo both ways
  validate :friends_with_self # Validate that contact and friend arent the same

  # Custom Methods
  def friends_with_self
    if :user_id == :friend_id
      errors.add(:user_id, 'Sorry. One cannot be friends with oneself')
    end
  end

  def friendship_desc
    self.contact.full_name + ' is friends with ' + self.friend.full_name
  end

  def friendship_short_desc
    self.contact.first_name + ' with ' + self.friend.first_name
  end
end
