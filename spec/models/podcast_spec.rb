require 'rails_helper'

RSpec.describe Podcast, :type => :model do
  it "has a valid factory" do
    FactoryGirl.build(:podcast).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:podcast, :name => nil).should_not be_valid
  end
  it "is invalid without a subdomain" do
    FactoryGirl.build(:podcast, :slug => nil).should_not be_valid
  end
end
