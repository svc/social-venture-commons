class TweetController < ApplicationController
  def create
    RAILS_DEFAULT_LOGGER.debug "#{current_user.screen_name}: #{session[:tw_pw]}"
    Twitter::Base.new(current_user.screen_name,session[:tw_pw]).post(params[:message])
    
    # MessageParser.get_messages_and_parse
    
    redirect_to params[:redirect_to]
  end
end