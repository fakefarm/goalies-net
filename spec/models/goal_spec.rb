require 'rails_helper'

describe Goal do

  it 'is valid with complete data' do
    goal = Goal.create name: 'learn to code', circle: 'personal', quarter: '1'
    expect(goal).to be_valid
  end

  it 'is invalid without complete data' do
    goal = Goal.create name: nil
    goal.valid?
    expect(goal).not_to be_valid
  end

  it 'takes an optional category' do
    goal = Goal.create(
      name: 'date night',
      circle: 'relational',
      category: 'activity',
      quarter: '1')
    expect(goal).to be_valid
  end

  it 'retrieves matching goals' do
    date = Goal.create name: 'date night', circle: 'relational', quarter: '1'
    play = Goal.create name: 'play night', circle: 'relational', quarter: '1'
    ignore_this  = Goal.create name: 'play day',   circle: 'responsibility'

    expect(Goal.find('night')).to eq [ date, play ]
  end
end
