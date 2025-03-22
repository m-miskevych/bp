require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:admin) { create(:user, role: :admin) }
  let(:user) { create(:user, role: :user) }
  let(:user_plan) { create(:user_plan, user: user) }

  let(:admin_comment) { create(:comment, user: admin, user_plan: user_plan) }
  let(:user_comment) { create(:comment, user: user, user_plan: user_plan) }

  describe 'associations' do
    it 'belongs to a user_plan' do
      expect(admin_comment.user_plan).to be_a(UserPlan)
      expect(user_comment.user_plan).to be_a(UserPlan)
    end

    it 'belongs to a user' do
      expect(admin_comment.user).to be_a(User)
      expect(user_comment.user).to be_a(User)
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(admin_comment).to be_valid
      expect(user_comment).to be_valid
    end

    it 'is invalid without a body' do
      admin_comment.body = nil
      expect(admin_comment).not_to be_valid
      expect(admin_comment.errors[:body]).to include("can't be blank")

      user_comment.body = nil
      expect(user_comment).not_to be_valid
      expect(user_comment.errors[:body]).to include("can't be blank")
    end
  end

  describe 'user roles' do
    it 'belongs to an admin' do
      expect(admin_comment.user.role).to eq('admin')
    end

    it 'belongs to a regular user' do
      expect(user_comment.user.role).to eq('user')
    end
  end
end
