require 'rails_helper'

describe Goal do

  it 'is valid with a name and circle' do
    goal = Goal.create name: 'learn to code', circle: 'personal'
    expect(goal).to be_valid
  end

  it 'is invalid without a name' do
    goal = Goal.create name: nil
    goal.valid?
    expect(goal).not_to be_valid
  end
  it 'takes an optional category' do
    goal = Goal.create(
      name: 'date night',
      circle: 'relational',
      category: 'activity'
      )
    expect(goal).to be_valid
  end

  it 'requires a circle to be selected' do
    goal = Goal.create name: 'swim', circle: nil
    goal.valid?
    expect(goal).not_to be_valid
  end

  it 'retrieves matching goals' do
    date = Goal.create name: 'date night', circle: 'relational'
    play = Goal.create name: 'play night', circle: 'relational'
    ignore_this  = Goal.create name: 'play day',   circle: 'responsibility'

    expect(Goal.find('night')).to eq [ date, play ]
  end
end
