require 'spec_helper'

describe WardrobeItemsController do

  let(:wardrobe_item) { wardrobe_item = WardrobeItem.create }

  describe 'GET index' do
    it "assigns all wardrobe items as @wardrobe_items" do
      # wardrobe_item = WardrobeItem.new
      # wardrobe_item.save
      # wardrobe_item = WardrobeItem.create # => use let()
      get :index
      expect(assigns('wardrobe_items')).to eq([wardrobe_item])
    end
  end

  describe 'GET show' do
    it "display information about a single wardrobe item" do
      get :show, { id: wardrobe_item.id }
      expect(assigns('wardrobe_item')).to eq(wardrobe_item)
    end
  end

end
