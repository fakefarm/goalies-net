require 'rails_helper'

describe Goal do

  it 'is valid with a name and circle' do
    goal = Goal.new name: 'learn to code', circle: 'personal'
    expect(goal).to be_valid
  end

  it 'is invalid without a name' do
    goal = Goal.new name: nil
    goal.valid?
    expect(goal).not_to be_valid
  end
  it 'takes an optional category' do
    goal = Goal.new(
      name: 'date night',
      circle: 'relational',
      category: 'activity'
      )
    expect(goal).to be_valid
  end

  it 'requires a circle to be selected' do
    goal = Goal.new name: 'swim', circle: nil
    goal.valid?
    expect(goal).not_to be_valid
  end
end
