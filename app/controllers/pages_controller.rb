class PagesController < ApplicationController
  
  def welcome
    @publication = Publication.first
  end
end
