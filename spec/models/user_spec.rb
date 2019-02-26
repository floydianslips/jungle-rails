require 'rails_helper'

RSpec.describe User, type: :model do
  
    subject {
      described_class.new(first_name: "billy", last_name: "daKid", email: "billy@dakid.com", password: "superman", password_confirmation: "superman")
    }
    let(:user2) { User.new(first_name: "sam", last_name: "youEll", email: "sam@sam.com", password: "superpoop", password_confirmation: "superpoop") }

  describe 'Validations' do

    it 'is valid with valid attibutes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'repeated email cannot be put into the database' do
      subject.save
      user2.email = "billy@dakid.com"
      expect(user2).to_not be_valid
    end
  
    it 'is not case sensitive when it comes to email' do
      subject.save
      user2.email = "BILLY@dakid.com"
      expect(user2).to_not be_valid
    end

    it "is not valid if password is not at least 6 characters long" do
      subject.password = "poop"
      expect(subject).to_not be_valid
    end
  end

    it "is not valid to have an email without @ or ." do
      subject.email = "jim"
      expect(subject).to_not be_valid
    end
  
  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "will not log in without proper authentication" do
      subject.save
      subject.password = "nottherightpassword"
      expect(User.authenticate_with_credentials(subject.email, subject.password)).to be_falsey
    end

    it "will allow whitespace before and after login" do
      subject.save
      subject.email = "    billy@dakid.com"
      expect(User.authenticate_with_credentials(subject.email, subject.password)).to be_truthy
    end
  end
end

