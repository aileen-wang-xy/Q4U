require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "Post show be present" do
    comment = Comment.new(post: nil)
    comment.valid?
    expect(comment.errors[:post]).to include("must exist")
  end

end