require 'test_helper'

class SlidesControllerTest < ActionController::TestCase

  describe "#index" do
    before do
      create_list(:slide, 3)
      get :index, format: :json 
    end
    
    it "should return 3 slides" do
      slides = JSON.parse(response.body)
      slides.size.must_equal 3
    end
  end

  describe "#create" do
    before do
      @request.env['HTTP_ACCEPT'] = "application/json"
    end

    it "should not create post without all paramaters" do
      assert_difference 'Slide.count', 0 do
        post :create, slide: { title: "Bla" }
      end
    end

    it "should create post with all paramaters" do
      assert_difference 'Slide.count', 1 do
        post :create, slide: { title: "Test", order: 1 }
      end
    end
  end
end

