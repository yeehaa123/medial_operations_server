require 'test_helper'

class SlideTest < ActiveSupport::TestCase
  
  context "slide attributes" do

    let(:slide) { build(:slide) }

    it "should not be valid without a title" do
      slide.title = nil
      slide.wont_be :valid?
    end

    it "should not be valid without an order" do
      slide.order = nil
      slide.wont_be :valid?
    end
    
    it "should have a integer as order" do
      slide.order = "bla"
      slide.wont_be :valid?
    end
    
    it "should have a unique order" do
      slide.save
      slide2 = build(:slide)
      slide2.order = slide.order
      slide2.wont_be :valid?
    end

  end
end
