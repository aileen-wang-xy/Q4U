require 'rails_helper'

RSpec.describe Post, type: :model do

  it "User show be present" do
    post = Post.new(user: nil)
    post.valid?
    expect(post.errors[:user]).to include("must exist")
  end

  it "Start time show be present" do
    post = Post.new(start_time: nil)
    post.valid?
    expect(post.errors[:start_time]).to include(": has already passed")
  end

  it "End time show be present" do
    post = Post.new(end_time: nil)
    post.valid?
    expect(post.errors[:end_time]).to include(": End time should be later than start time")
  end
end