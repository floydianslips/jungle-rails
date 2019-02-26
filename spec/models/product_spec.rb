require 'rails_helper'

RSpec.describe Product, type: :model do
  cat = Category.new
  subject {
    described_class.new(name: "Boogers", price: 30, quantity: 120, category: cat)
  }  

  describe 'Validations' do
  
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "it is not valid without a name" do
      subject.name = nil
      puts subject.errors.full_messages
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Price is not a number")
    end

    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Category can't be blank")
     end

     it "it is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Quantity can't be blank") 
     end
  end
end
