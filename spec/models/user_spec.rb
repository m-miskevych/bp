require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:admin) { create(:user, role: :admin) }

  describe "associations" do
    it "can have multiple associated clients if it is an admin" do
      client1 = create(:user, admin: admin)
      client2 = create(:user, admin: admin)

      expect(admin.users).to include(client1, client2)
    end

    it "allows a user to belong to an admin" do
      client = create(:user, admin: admin)
      expect(client.admin).to eq(admin)
    end

    it "has many user_plans" do
      plan1 = create(:plan)
      plan2 = create(:plan)

      create(:user_plan, user: user, plan: plan1)
      create(:user_plan, user: user, plan: plan2)

      expect(user.plans).to include(plan1, plan2)
    end

    it "has many comments" do
      comment1 = create(:comment, user: user)
      comment2 = create(:comment, user: user)

      expect(user.comments).to include(comment1, comment2)
    end

    it "destroys associated user_plans when user is deleted" do
      plan = create(:plan)
      create(:user_plan, user: user, plan: plan)

      expect { user.destroy }.to change(UserPlan, :count).by(-1)
    end

    it "destroys associated comments when user is deleted" do
      create(:comment, user: user)
      expect { user.destroy }.to change(Comment, :count).by(-1)
    end
  end

  describe "validations" do
    it "is valid with a name, email, and password" do
      expect(user).to be_valid
    end

    it "is invalid without an email" do
      user.email = nil
      expect(user).not_to be_valid
    end

    it "is invalid without a password" do
      user.password = nil
      expect(user).not_to be_valid
    end

    it "is invalid with a duplicate email" do
      create(:user, email: "duplicate@example.com")
      duplicate_user = build(:user, email: "duplicate@example.com")
      expect(duplicate_user).not_to be_valid
    end
  end

  describe "default values" do
    it "sets default role to admin during registration" do
      new_user = User.new(email: "new@example.com", password: "password", password_confirmation: "password")
      expect(new_user.role).to eq("admin")
    end
  end
end
