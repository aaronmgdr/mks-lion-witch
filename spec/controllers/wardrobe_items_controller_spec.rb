require 'spec_helper'

describe WardrobeItemsController do
  describe 'GET index' do
    it "assigns all wardrobe items as @wardrobe_items" do
      # wardrobe_item = WardrobeItem.new
      # wardrobe_item.save
      wardrobe_item = WardrobeItem.create
      get :index
      
      expect(assigns ('wardrobe_items')).to eq([wardrobe_item])
    end
  end
end
