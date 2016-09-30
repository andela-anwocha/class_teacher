require "rails_helper"

describe TeachersController, type: :controller do
  describe "GET #new" do
    before { get :new }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns a new teacher to @teacher" do
      expect(assigns(:teacher)).to be_a_new(Teacher)
    end

    it "renders the new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are provided" do
      before { post :create, teacher: attributes_for(:teacher) }

      it "creates the teacher" do
        expect(Teacher.count).to eq(1)
      end

      it "saves the teacher_id in session" do
        expect(session[:teacher_id]).to eq(Teacher.first.id)
      end

      it "redirects to the root_path" do
        expect(response).to redirect_to "/"
      end
    end

    context "when valid params are not provided" do
      before { post :create, teacher: attributes_for(:teacher, name: "") }

      it "does not create the teacher" do
        expect(Teacher.count).to_not eq(1)
      end

      it "assigns the errors to flash[:errors]" do
        expect(flash[:errors]).to_not be_nil
      end
    end
  end
end
