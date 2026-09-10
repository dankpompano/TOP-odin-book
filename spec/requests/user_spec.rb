require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { FactoryBot.create(user) }
  context "GET /index" do
    xit "should render index page" do
      get users_path
      expect(response).to render_template :index
    end
  end

  context "GET /new" do
    it "should render new page" do
      get users_path
      expect(response).to render_template :new
    end
  end
end
