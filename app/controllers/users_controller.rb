# TODO: Refactor and remove 
class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
	before_filter :login_required, :only => [:index]

	def index
		redirect_to user_path(current_user)
	end

  def show
    @user = Account.find_by_screen_name(params[:id],:include=>[:messages])
    
    render :action=>'user_not_found'and return unless @user 
        
		@user_messages = @user.messages.paginate(:order=>'created_at DESC',:page=>params[:page])
		
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
end
