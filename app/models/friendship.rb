class Friendship < ActiveRecord::Base
  belongs_to :contact
  belongs_to :friend, :class_name => 'Contact'

  def friendship_desc
    self.contact.full_name + ' is friends with ' + self.friend.full_name
  end
end
