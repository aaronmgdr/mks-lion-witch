require 'spec_helper'



describe WardrobeItemsController do

  let(:wardrobe_item) {wardrobe_item = WardrobeItem.create}


  describe 'GET index' do
    it "assigns all wardrobe items as @wardrobe_items" do
      # wardrobe_item = WardrobeItem.new
      # wardrobe_item.save
      # wardrobe_item = WardrobeItem.create
      # ^^^ these lines are fulfileled by the line below, and the let helper
      get :index
      
      expect(assigns('wardrobe_items')).to eq([wardrobe_item])
    end
  end

  describe 'GET show' do
    it 'shows the object passed in and its attributes' do

      get :show, { id: wardrobe_item }

      expect(assigns('wardrobe_item')).to eq(wardrobe_item)
    end
  end
end
