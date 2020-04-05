require 'rails_helper'

RSpec.describe Deal, type: :model do

  it "Creator show be present" do
    deal = Deal.new(creator: nil)
    deal.valid?
    expect(deal.errors[:creator]).to include("must exist")
  end

  it "Collector show be present" do
    deal = Deal.new(collector: nil)
    deal.valid?
    expect(deal.errors[:collector]).to include("must exist")
  end

end