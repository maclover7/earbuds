require 'rails_helper'

RSpec.describe "podcasts/edit", :type => :view do
  before(:each) do
    @podcast = assign(:podcast, Podcast.create!(
      :name => "MyString",
      :about => "",
      :slug => "MyString"
    ))
  end

  it "renders the edit podcast form" do
    render

    assert_select "form[action=?][method=?]", podcast_path(@podcast), "post" do

      assert_select "input#podcast_name[name=?]", "podcast[name]"

      assert_select "input#podcast_about[name=?]", "podcast[about]"

      assert_select "input#podcast_slug[name=?]", "podcast[slug]"
    end
  end
end
