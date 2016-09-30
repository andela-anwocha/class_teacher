require "rails_helper"

describe StudentsController, type: :controller do
  before do
    @teacher = create(:teacher)
    @teacher_class = create(:teacher_class, teacher_id: @teacher.id)
    session[:teacher_id] = @teacher.id
  end

  describe "GET #new" do
    before { get :new, teacher_class_id: @teacher_class.id }

    it "renders the new template" do
      expect(response).to render_template(:new)
    end

    it "assigns a new student to @student" do
      expect(assigns(:student)).to be_a_new Student
    end
  end

  describe "POST #create" do
    context "when valid data is provided" do
      before do
        post :create, student: attributes_for(:student),
                      teacher_class_id: @teacher_class.id
      end

      it "redirects_to the the teacher_class" do
        expect(response).to redirect_to(
          teacher_class_students_path(@teacher_class)
        )
      end

      it "creates new student" do
        expect(Student.count).to eq(1)
      end
    end

    context "when invalid data is provided" do
      before do
        post :create, student: attributes_for(:student, name: ""),
                      teacher_class_id: @teacher.id
      end

      it "assigns errors to flash[:errors]" do
        expect(flash[:errors]).to_not be_nil
      end

      it "renders the new template" do
        expect(response).to render_template(:new)
      end
    end
  end
end
