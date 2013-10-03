require 'spec_helper'

describe WardrobeItemsController do
  let(:valid_attributes) { { "garment" => "boots"} }
  let(:invalid_attributes) { {"garment" => ""} }
  let(:wardrobe_item) {WardrobeItem.create valid_attributes}
  let(:return_false_on_save) {allow_any_instance_of(WardrobeItem).to receive(:save).and_return(false)}


  describe 'GET index' do
    it "assigns all wardrobe items as @wardrobe_items" do
      wardrobe_item
      get :index

      expect(assigns('wardrobe_items')).to eq([wardrobe_item])
    end
  end

  describe 'GET show' do
    it "assigns the requested wardrobe item as @wardrobe_item" do
      wardrobe_item
      get :show, { id: wardrobe_item }

      expect(assigns('wardrobe_item')).to eq(wardrobe_item)
    end
  end

  describe 'GET new' do
   it "assigns a new wardrobe_item as @wardrobe_item" do
      get :new
      expect(assigns(:wardrobe_item)).to be_a_new(WardrobeItem)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new WardrobeItem" do
        expect {
          post :create, {:wardrobe_item => valid_attributes}
        }.to change(WardrobeItem, :count).by(1)
      end

      it "assigns a newly created wardrobe_item as @wardrobe_item" do
        post :create, {:wardrobe_item => valid_attributes}
        expect(assigns(:wardrobe_item)).to be_a(WardrobeItem)
        expect(assigns(:wardrobe_item)).to be_persisted
      end

      it "redirects to the created wardrobe_item" do
        post :create, {:wardrobe_item => valid_attributes}
        expect(response).to redirect_to(WardrobeItem.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved wardrobe_item as @wardrobe_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        return_false_on_save
        post :create, {:wardrobe_item => invalid_attributes}
        expect(assigns(:wardrobe_item)).to be_a_new(WardrobeItem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        return_false_on_save
        post :create, {:wardrobe_item => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe 'GET edit' do
    it "assigns the requested wardrobe item as @wardrobe_item" do
      wardrobe_item
      get :edit, { id: wardrobe_item }

      expect(assigns('wardrobe_item')).to eq(wardrobe_item)
    end
  end

  describe 'PUT update' do
    context "with valid_attributes" do
      it "assigns the requested wardrobe_item as @wardrobe_item" do
        wardrobe_item
        put :update, {:id => wardrobe_item, :wardrobe_item => valid_attributes }
        expect(assigns(:wardrobe_item)).to eq(wardrobe_item)
      end

      it "redirects to the wardrobe_item" do
        wardrobe_item
        put :update, {:id => wardrobe_item, :wardrobe_item => valid_attributes }
        expect(response).to redirect_to(wardrobe_item)
      end

      it "updates the requested wardrobe_item" do
        wardrobe_item
        expect_any_instance_of(WardrobeItem).to receive(:update).with(valid_attributes)

        put :update, {:id => wardrobe_item, :wardrobe_item => valid_attributes }
      end
    end

    context "with invalid params" do
      let(:invalid_update) {put :update, {:id => wardrobe_item, :wardrobe_item => invalid_attributes}}

      it "assigns the wardrobe_item as @wardrobe_item" do
        wardrobe_item
        #trigger behavoir for invalid attributes
        return_false_on_save
        invalid_update

        expect(assigns(:wardrobe_item)).to eq(wardrobe_item)
      end

      it "re-renders the 'edit template" do
        wardrobe_item
        return_false_on_save
        invalid_update

        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE destroy" do
      it "destroys the requested wardrobe_item" do
        wardrobe_item

        expect{
          delete :destroy, {:id => wardrobe_item}
        }.to change(WardrobeItem, :count).by(-1)
      end

      it "redirects to the wardrobe_items list" do
        wardrobe_item

        delete :destroy, { :id => wardrobe_item}

        expect(response).to render_template('index')
      end
    end
end
