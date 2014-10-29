require 'rails_helper'

describe GoalsController do
  describe 'GET /goals' do
    it 'returns all goals' do
      FactoryGirl.create :goal, name: 'learn to code', circle: 'responsibility'
      FactoryGirl.create :goal, name: 'date Danae.', circle: 'relational'

      get "index", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      goals = body.map { |g| g['name'] }
      expect(goals).to match_array(['learn to code', 'date Danae.'])
    end
  end
end
