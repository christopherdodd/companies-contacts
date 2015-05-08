class Contact < ActiveRecord::Base
  belongs_to :company
  has_many :friendships
  has_many :friends, :through => 'friendships'

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
