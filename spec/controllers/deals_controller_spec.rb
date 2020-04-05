require 'rails_helper'

describe DealsController do

    describe "GET #index", type: :controller do

      it "renders the :index view" do
        get 'index'
        expect(response).to have_http_status(302)
      end
    end

end