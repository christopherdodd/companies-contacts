class Friendship < ActiveRecord::Base

  # Relationships
  belongs_to :contact
  belongs_to :friend, :class_name => 'Contact'

  # Validations
  validate :uniqueness_of_combination
  validate :cannot_be_friends_with_self # Validate that contact and friend arent the same

  # Custom Methods
  def uniqueness_of_combination

    attempted_friendship = [contact_id, friend_id]

    Friendship.all.each do |f|
      inverse_friendship = [f.friend.id, f.contact.id]
      if attempted_friendship == inverse_friendship || attempted_friendship == [f.contact_id, f.friend_id]
        errors.add(:users_id,'. Friendship already exists')
      end
    end
  end

  def cannot_be_friends_with_self
    if contact_id == friend_id
      errors.add(:user_id, '. Sorry, One cannot be friends with oneself')
    end
  end

  def friendship_desc
    self.contact.full_name + ' is friends with ' + self.friend.full_name
  end

  def friendship_short_desc
    self.contact.first_name + ' with ' + self.friend.first_name
  end
end
