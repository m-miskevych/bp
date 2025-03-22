require 'rails_helper'

RSpec.describe UserPlan, type: :model do
  let(:user_plan) { create(:user_plan) }

  describe "associations" do
    it "belongs to a user" do
      expect(user_plan.user).to be_a(User)
    end

    it "belongs to a plan" do
      expect(user_plan.plan).to be_a(Plan)
    end

    it "can have many comments" do
      comment1 = create(:comment, user_plan: user_plan)
      comment2 = create(:comment, user_plan: user_plan)
      expect(user_plan.comments).to include(comment1, comment2)
    end

    it "destroys associated comments when the user_plan is destroyed" do
      create(:comment, user_plan: user_plan)
      create(:comment, user_plan: user_plan)

      expect(Comment.count).to eq(2)

      user_plan.destroy

      expect(Comment.count).to eq(0)
    end
  end

  describe "validations" do
    it "is valid with a user and a plan" do
      expect(user_plan).to be_valid
    end

    it "is invalid without a user" do
      user_plan.user = nil
      expect(user_plan).not_to be_valid
    end

    it "is invalid without a plan" do
      user_plan.plan = nil
      expect(user_plan).not_to be_valid
    end

    it "is invalid with a duplicate user and plan combination" do
      user = create(:user)
      plan = create(:plan)

      create(:user_plan, user: user, plan: plan)
      duplicate_user_plan = build(:user_plan, user: user, plan: plan)

      expect(duplicate_user_plan).not_to be_valid
      expect(duplicate_user_plan.errors[:user_id]).to include("už má tento plán priradený")
    end
  end

  describe "enums" do
    it "has a default status of 'draft'" do
      expect(user_plan.status).to eq("draft")
    end

    it "can set status to 'in_progress'" do
      user_plan.update!(status: :in_progress)
      expect(user_plan.status).to eq("in_progress")
    end

    it "can set status to 'done'" do
      user_plan.update!(status: :done)
      expect(user_plan.status).to eq("done")
    end
  end

  describe "scopes" do
    it "returns user plans with status draft" do
      draft_plan = create(:user_plan, status: :draft)
      create(:user_plan, status: :in_progress)

      expect(UserPlan.draft).to include(draft_plan)
      expect(UserPlan.draft.count).to eq(1)
    end

    it "returns user plans with status in_progress" do
      in_progress_plan = create(:user_plan, status: :in_progress)
      create(:user_plan, status: :done)

      expect(UserPlan.in_progress).to include(in_progress_plan)
      expect(UserPlan.in_progress.count).to eq(1)
    end

    it "returns user plans with status done" do
      done_plan = create(:user_plan, status: :done)
      create(:user_plan, status: :draft)

      expect(UserPlan.done).to include(done_plan)
      expect(UserPlan.done.count).to eq(1)
    end
  end
end
