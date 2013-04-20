require 'test_helper'

class SlideTest < ActiveSupport::TestCase
  
  context "slide attributes" do

    let(:slide) { build(:slide) }

    it "should not be valid without a title" do
      slide.title = nil
      slide.wont_be :valid?, "slide has not title"
    end

    it "should not be valid without an order" do
      slide.order = nil
      assert !slide.valid?, "slide has no order"
    end
    
    it "should have a integer as order" do
      slide.order = "bla"
      assert !slide.valid?, "slide has a non-numerical order"
    end
    
    it "should have a unique order" do
      slide.save
      slide2 = build(:slide)
      slide2.order = slide.order
      assert !slide2.valid?, "slide has no unique order"
    end

  end
end
