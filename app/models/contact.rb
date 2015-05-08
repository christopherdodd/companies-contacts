class Contact < ActiveRecord::Base
  belongs_to :company
  has_many :friendships
  has_many :friends, :through => 'friendships'
end
