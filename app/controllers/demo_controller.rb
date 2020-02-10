class DemoController < ApplicationController

  layout false

  def index
  end

  def hello
    @array = [1,2,3,4,5]


    @id = params[:id]
    @page = params[:page]
  end

  def google
    redirect_to("www.google.com")
  end
end
