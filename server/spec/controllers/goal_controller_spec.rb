require 'rails_helper'

describe GoalsController do
  describe 'GET /goals' do
    it 'returns all goals' do
      FactoryGirl.create :goal, name: 'learn to code', circle: 'responsibility'
      FactoryGirl.create :goal, name: 'date Danae.', circle: 'relational'

      # FIX
      # get '/goals', {}, { "Accept" => "application/json" }

      get "index", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      goals = body.map { |g| g['name'] }
      expect(goals).to match_array(['learn to code', 'date Danae.'])
    end
  end

  describe 'GET /goals/:id' do
    it 'returns a request goal' do
      g = FactoryGirl.create :goal, name: 'swim 500 miles', circle: 'personal'

      # FIX
      # get "show/#{g.id}", {}, { "Accept" => "application/json" }
      get :show, id: g.id
      expect(response.status).to eq 200
      body = JSON.parse(response.body).first
      expect(body["name"]).to eq 'swim 500 miles'
    end
  end
end
