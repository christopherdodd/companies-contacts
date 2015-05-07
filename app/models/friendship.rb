class Friendship < ActiveRecord::Base
  belongs_to :contact
  belongs_to :friend, :class_name => 'Contact'
end
