require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { create(:user) }
  let(:user_plan) { create(:user_plan, user: user) }
  let(:comment) { create(:comment, user_plan: user_plan, user: user) }

  before do
    post user_session_path, params: { user: { email: user.email, password: "password" } }
  end

  describe "POST /user_plans/:user_plan_id/comments" do
    context "with valid attributes" do
      it "creates a comment" do
        expect {
          post user_plan_comments_path(user_plan), params: { comment: { body: "This is a test comment" } }
        }.to change(Comment, :count).by(1)

        expect(response).to redirect_to(user_plan_path(user_plan))
        follow_redirect!
        expect(response.body).to include("Comment has been created.")
      end
    end

    context "with invalid attributes" do
      it "does not create a comment with empty body" do
        expect {
          post user_plan_comments_path(user_plan), params: { comment: { body: "" } }
        }.not_to change(Comment, :count)

        expect(response).to redirect_to(user_plan_path(user_plan))
        follow_redirect!
        expect(response.body).to include("Comment has not been created.")
      end
    end
  end

  describe "DELETE /user_plans/:user_plan_id/comments/:id" do
    it "deletes the comment" do
      comment # ensure comment exists before trying to delete it

      expect {
        delete user_plan_comment_path(user_plan, comment)
      }.to change(Comment, :count).by(-1)

      expect(response).to redirect_to(user_plan_path(user_plan))
    end
  end
end
