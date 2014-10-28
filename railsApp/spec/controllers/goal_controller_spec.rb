require 'rails_helper'

describe GoalsController do
  describe 'GET #index' do
    context 'without params[:term]' do
      it 'populates an array of all goals' do
        expect(true).to be_false
      end
      it 'renders the :index as json'
    end
  end
end
