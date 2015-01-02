require 'rails_helper'

RSpec.describe "podcasts/index", :type => :view do
  before(:each) do
    assign(:podcasts, [
      Podcast.create!(
        :name => "Name",
        :about => "",
        :slug => "Slug"
      ),
      Podcast.create!(
        :name => "Name",
        :about => "",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of podcasts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
