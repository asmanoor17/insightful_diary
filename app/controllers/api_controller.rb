class ApiController < ApplicationController
  def get_news_articles
    query = params[:query]
    url = "https://newsapi.org/v2/everything?q=#{query}&apiKey=9450f0b51bfc4e98817505da547b1e32"

    response = RestClient.get(url)
    render json: JSON.parse(response.body)
  rescue RestClient::ExceptionWithResponse => e
    render json: { error: e.response.body }, status: e.response.code
  end
end

