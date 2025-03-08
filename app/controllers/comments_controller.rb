class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_plan

  def create
    @comment = @user_plan.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to user_plan_path(@user_plan)
    else
      flash[:alert] = "Comment has not been created."
      redirect_to user_plan_path(@user_plan)
    end
  end

  def destroy
    @comment = @user_plan.comments.find(params[:id])
    @comment.destroy

    redirect_to user_plan_path(@user_plan)
  end


  private

  def set_user_plan
    @user_plan = UserPlan.find(params[:user_plan_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
