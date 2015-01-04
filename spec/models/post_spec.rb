require 'spec_helper'

describe Post, :type => :model do
  it 'is not valid with a name of less than three characters' do
    post = Post.new(title: 'aa')
    expect(post).to have(1).error_on(:title)
    expect(post).not_to be_valid
  end
end
