require "rails_helper"

RSpec.describe "Videos API", type: :request do
  let!(:user) { create(:user) }
  let!(:video) { create(:video) }
  let(:headers) { { "Authorization" => token_generator(user.id) } }
  let(:valid_attributes) do
    {
      link: 'https://github.com/toluola' 
    }
  end

  # Share video test suite
  describe "POST /share" do
    context "when valid request" do
      before { post "/share", params: valid_attributes, headers: headers }

      it "share a video" do
        expect(response).to have_http_status(201)
      end

      it "returns success message" do
        expect(json["message"]).to match(/Video shared successfully/)
      end
    end

    context "when invalid request" do
      before { post "/share", params: {}, headers: headers }

      it "does not create a new user" do
        expect(response).to have_http_status(422)
      end

      it "returns failure message" do
        expect(json["message"]).
          to match(/Link can't be blank, Link is not a valid URL/)
      end
    end
  end

  describe "GET /products" do
    before { get "/share", params: {}, headers: headers }
    it "returns product" do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end