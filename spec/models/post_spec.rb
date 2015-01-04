require 'spec_helper'

describe Post, :type => :model do
  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(title: 'aa')
    expect(page).to have(1).error_on(:title)
    expect(page).not_to be_valid
  end
end
