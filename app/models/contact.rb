class Contact < ActiveRecord::Base
  has_one :company
  has_many :friendships
  has_many :friends, :through => 'friendships'
end
