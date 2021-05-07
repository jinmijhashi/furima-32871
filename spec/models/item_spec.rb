require 'rails_helper'

RSpec.describe Item, type: :model do
  
 describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
      context '出品できる時' do
        it "全て入力してあれば出品できる" do
          expect(@item).to be_valid
        end
      end
      context "出品できない時" do
        it "titleが空では出品できない" do
          @item.title = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end 
        
        it "texiが空では出品できない" do
          @item.text = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end
          it "imageが空では出品できない" do
            @item.image = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Image can't be blank")
          end
          it "category_idが空では出品できない" do
            @item.category_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Category is not a number")
          end
          it "category_idが1では出品できない" do
            @item.category_id = '1'
            @item.valid?
            expect(@item.errors.full_messages).to include("Category must be other than 1")
          end
          it "shipping_idが空では出品できない" do
            @item.shipping_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Shipping is not a number")
          end  
          it "shipping_idが1では出品できない" do
            @item.shipping_id = '1'
            @item.valid?
            
            expect(@item.errors.full_messages).to include("Shipping must be other than 1")
          end  
          it "shipping_area_idが空では出品できない" do
            @item.shipping_area_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Shipping area is not a number")
          end
          it "shipping_area_idが0では出品できない" do
            @item.shipping_area_id = '0'
            @item.valid?
            expect(@item.errors.full_messages).to include("Shipping area must be other than 0")
          end
          it "status_idが空では登録できない" do
            @item.status_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Status is not a number")
          end
          it "status_idが1では登録できない" do
            @item.status_id = '1'
            @item.valid?
            expect(@item.errors.full_messages).to include("Status must be other than 1")
            end
          it "days_to_ship_idが空では登録できない" do
            @item.days_to_ship_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Days to ship is not a number")
          end
          it "days_to_ship_idが1では登録できない" do
            @item.days_to_ship_id = '1'
            @item.valid?
            expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
            end
      end
 end
end

