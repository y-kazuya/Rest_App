require 'rails_helper'

RSpec.describe Owner, type: :model do
  describe "oewner ヴァ李テーション" do
    it "全パス" do
      expect(FactoryBot.build(:owner)).to be_valid
    end


    it "ななし" do
      owner = FactoryBot.build(:owner, name: nil)
      owner.valid?
      expect(owner.errors[:name]).to include("can't be blank")
    end

    it "mailなし" do
      owner = FactoryBot.build(:owner, email: nil)
      owner.valid?
      expect(owner.errors[:email]).to include("can't be blank")
    end

    it "long_name" do
      owner = FactoryBot.build(:owner, name: "#{"a" * 51}")
      owner.valid?
      expect(owner.errors[:name]).to include("is too long (maximum is 50 characters)")
    end

    it "long_email" do
      owner = FactoryBot.build(:owner, email: "#{"a" * 92}@test.test")
      owner.valid?
      expect(owner.errors[:email]).to include("is too long (maximum is 100 characters)")
    end

    it "long_profile" do
      owner = FactoryBot.build(:owner, profile: "#{"a" * 501}")
      owner.valid?
      expect(owner.errors[:profile]).to include("is too long (maximum is 500 characters)")
    end

    it "long_born" do
      owner = FactoryBot.build(:owner, born: "#{"a" * 101}")
      owner.valid?
      expect(owner.errors[:born]).to include("is too long (maximum is 100 characters)")
    end

    it "learge_age" do
      owner = FactoryBot.build(:owner, age: 101)
      owner.valid?
      expect(owner.errors[:age]).to include("must be less than or equal to 100")
    end

    it "format_email" do
      expect(FactoryBot.build(:owner, email: "aaaaaaaaa@aaaaa")).not_to be_valid
    end

    it "uniqe_email" do
      FactoryBot.create(:owner, email: "test@test.test")
      owner = FactoryBot.build(:owner, email: "test@test.test")
      owner.valid?
      expect(owner.errors[:email]).to include("has already been taken")
    end

    it "uniqe_name" do
      FactoryBot.create(:owner, name: "test")
      owner = FactoryBot.build(:owner, name: "test")
      owner.valid?
      expect(owner.errors[:name]).to include("has already been taken")
    end

    it "uniqe_phone_number" do
      FactoryBot.create(:owner, phone_number: 1111)
      owner = FactoryBot.build(:owner, phone_number: 1111)
      owner.valid?
      expect(owner.errors[:phone_number]).to include("has already been taken")
    end


  end
end
