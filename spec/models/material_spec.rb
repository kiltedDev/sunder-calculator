require 'rails_helper'

RSpec.describe Material, type: :model do
  before(:example) do
    @new_material = Material.create(name: "Unobtainium", hardness: 40, hp_per_inch: 80)
  end

  context "#name" do
    it { should have_valid(:name).when("Fighter", "Mage", "Thief") }
    it { should_not have_valid(:name).when(nil, "") }

    it {should validate_uniqueness_of(:name) }
  end

  context "#hardness" do
    it { should have_valid(:hardness).when(6, 8, 10, 12) }
    it { should_not have_valid(:hardness).when(nil, "", -4) }
  end

  context "#hp_per_inch" do
    it { should have_valid(:hp_per_inch).when(2,5,10,20) }
    it { should_not have_valid(:hp_per_inch).when(nil, "", -4) }
  end

  context "#associations" do
    it { should belong_to :object }
  end
end
