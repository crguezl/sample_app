class StaticPagesController < ApplicationController
  def home
    @chuchu = "hello!"
    respond_to do |format|
      format.html
    end
  end

  def help
    @titi = "Ayudaaaa!!!!!!"
    respond_to do |format|
      format.html
    end
  end

  def about
  end

  def contact
    respond_to do |format|
      format.html
    end
  end
end
