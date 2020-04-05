require 'rails_helper'

RSpec.describe Review, type: :model do

  it "Reviewer show be present" do
    review = Review.new(reviewer: nil)
    review.valid?
    expect(review.errors[:reviewer]).to include("must exist")
  end

  it "Be_reviewed show be present" do
    review = Review.new(be_reviewed: nil)
    review.valid?
    expect(review.errors[:be_reviewed]).to include("must exist")
  end

  it "Deal show be present" do
    review = Review.new(deal: nil)
    review.valid?
    expect(review.errors[:deal]).to include("must exist")
  end
end