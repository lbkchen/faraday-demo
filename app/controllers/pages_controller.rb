class PagesController < ApplicationController
  def home
    if params[:q]
      @client ||= ApiClient.new
      @result = @client.topic_search params[:q]
    end
  end
end
