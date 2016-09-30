require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "GET #new" do
    before { get :new }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when teacher params are valid" do
      before do
        @teacher = create(:teacher)
        post :create, attributes_for(:teacher)
      end

      it "creates new session for the teacher" do
        expect(response).to redirect_to "/"
      end

      it "redirects to root_path" do
        expect(session[:teacher_id]).to eq(@teacher.id)
      end
    end

    context "when teacher params are invalid" do
      before do
        post :create, attributes_for(:teacher, email: "")
      end

      it "assigns errors to flash[:errors]" do
        expect(flash[:errors]).to eq(["Email or Password Invalid"])
      end
    end
  end
end
