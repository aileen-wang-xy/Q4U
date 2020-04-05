require 'rails_helper'

describe PostsController do

    describe "GET #index", type: :controller do

      it "renders the :index view" do
        get 'index'
        expect(response).to render_template("index")
      end
    end

    describe "POST #search", type: :controller do

      it "renders the :search" do
        request.host = 'localhost:3000/'
        request.env['HTTP_REFERER'] = 'index'
        post 'search'
        expect(response).to have_http_status(302)
      end
    end

    describe "GET #new", type: :controller do

      it "renders the :new" do
        get 'new'
        expect(response).to have_http_status(200)
      end
    end
end