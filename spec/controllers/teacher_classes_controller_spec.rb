require "rails_helper"

describe TeacherClassesController, type: :controller do
  let(:teacher_classes) { create_list(:teacher_class, 10) }
  before do
    @teacher = create(:teacher)
    session[:teacher_id] = @teacher.id
  end

  describe "GET #index" do
    before do
      @teacher_classes = create_list(:teacher_class, 3, teacher_id: @teacher.id)
      get :index
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "assigns all TeacherClasses to @teacher_classes" do
      expect(assigns(:teacher_classes)).to match_array(@teacher_classes)
    end
  end

  describe "GET #new" do
    before { get :new }

    it "renders the new template" do
      expect(response).to render_template(:new)
    end

    it "assigns a new TeacherClass to @teacher_class" do
      expect(assigns(:teacher_class)).to be_a_new(TeacherClass)
    end
  end

  describe "POST #create" do
    context "when valid params are provided" do
      before do
        post :create, teacher_class: attributes_for(:teacher_class)
      end

      it "creates a new teacher_class" do
        expect(@teacher.teacher_classes.count).to eq(1)
      end

      it "redirects to the teacher_class_path" do
        expect(response).to redirect_to teacher_class_path(id: Teacher.last.id)
      end
    end

    context "when invalid params are provided" do
      it "assigns the errors to flash[:errors]" do
        post :create, teacher_class: attributes_for(:teacher_class, name: "")
        expect(flash[:errors]).to_not be_nil
      end
    end
  end
end
