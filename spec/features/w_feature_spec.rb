require 'rails_helper'

RSpec.describe 'WidgetFeature', type: :feature do

  before :each do
    @widget = FactoryGirl.create :widget
  end

  it "should work on widget path" do
    visit widget_path(@widget)
    expect(page).to have_content @widget.name
  end

  describe "with js", js: true do
    it "should work on widget path" do
      expect(Widget.find(@widget.to_param)).to be_present # no error
      visit widget_path(@widget) # error: ActiveRecord::RecordNotFound in controller from Vehicle.find (same as above line)
      expect(page).to have_content @widget.name
    end
  end
end