require 'rails_helper'

describe Contact, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:contact)).to be_valid
  end

  it "is invalid without a firstname" do
    expect(FactoryGirl.build(:contact, first_name: nil)).to_not be_valid
  end

  it "is invalid without a lastname" do
    expect(FactoryGirl.build(:contact, last_name: nil)).to_not be_valid
  end

  it "allows contact photo upload"

end
