class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @stories_submitted = @user.stories.find(:all, :limit => 6, :order => 'stories.id DESC')
    @stories_voted_on = @user.stories_voted_on.find(:all, :limit => 6, :order => 'votes.id DESC')
  end
end
