describe UsersController do

    describe "GET #show", type: :controller do

      it "renders the :show view" do

        expect(User).to receive(:find).and_return({})

        get 'show'
        expect(response).to have_http_status(200)
      end
    end

end