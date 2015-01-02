require 'rails_helper'

RSpec.describe "podcasts/new", :type => :view do
  before(:each) do
    assign(:podcast, Podcast.new(
      :name => "MyString",
      :about => "",
      :slug => "MyString"
    ))
  end

  it "renders new podcast form" do
    render

    assert_select "form[action=?][method=?]", podcasts_path, "post" do

      assert_select "input#podcast_name[name=?]", "podcast[name]"

      assert_select "input#podcast_about[name=?]", "podcast[about]"

      assert_select "input#podcast_slug[name=?]", "podcast[slug]"
    end
  end
end
