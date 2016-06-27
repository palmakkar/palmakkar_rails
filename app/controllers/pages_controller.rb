class PagesController < ApplicationController
  def about
  	@now = Time.now
  end

  def index
  end

  def contact
    @message = Message.new
  end

  def login
  end

  def admin
    @messages = Message.all
    @time = Time.now
  end
end
