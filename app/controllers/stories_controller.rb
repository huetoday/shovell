class StoriesController < ApplicationController
  before_filter :login_required, :only => [:new, :create]
  def index
    fetch_stories 'votes_count >= 5'
  end
  
  def new
    @story = Story.new
  end 
  
  def create
    @story = @current_user.stories.build params[:story]   # get param form form names.
    if @story.save
      flash[:notice] = "Story submission succeeded" # set flash content.
      redirect_to stories_path # force page redirect to controller path.
    else # if error occurs, keep page in NEW path.
      render :action => 'new'
    end   
  end
  
  def show
    @story = Story.find(params[:id])
  end
  
  def bin
    fetch_stories 'votes_count < 5'
    render :action => 'index'
  end
  
  protected
  def fetch_stories(conditions)
    @stories = Story.find :all, :order => 'id DESC', :conditions => conditions
  end
end
