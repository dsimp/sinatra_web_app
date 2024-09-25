require "sinatra"
require "sinatra/reloader"
require "http"


POPULAR_CITIES = ["New York", "London", "Tokyo", "Paris", "Sydney", "Rio de Janeiro", "Cairo", "Moscow", "Beijeng"]

get("/") do

  @raw_response = HTTP.get("http://api.weatherapi.com/v1/current.json?key=#{ENV.fetch("WEATHER_KEY")}&q=chicago&aqi=no"
  )
  
  @string_response = @raw_response.to_s
  @parsed_response = JSON.parse(@string_response)
  @location = @parsed_response.fetch("location")
  @city = @location.fetch("name")
  @current = @parsed_response.fetch("current")
  @temp = @current.fetch("temp_f")
  erb :homepage, locals: { cities: POPULAR_CITIES }
end



get '/api_request' do
    @user_input = params.fetch("user_input").strip
    @weather_data = fetch_weather_data(@user_input)
    erb :weather_result, locals: {temp: @temp, weather_text: @weather_text, city: @city}
end



def fetch_weather_data (user_input)
  @raw_response = HTTP.get("http://api.weatherapi.com/v1/current.json?key=#{ENV.fetch("WEATHER_KEY")}&q=#{@user_input}&aqi=no"
    )
  @string_response = @raw_response.to_s
  @parsed_response = JSON.parse(@string_response)
  @current = @parsed_response.fetch("current")
  @temp = @current.fetch("temp_f")
  @location = @parsed_response.fetch("location")
  @city = @location.fetch("name")
  @condition = @current.fetch("condition")
  @weather_text = @condition.fetch("text")

end

helpers do

  def background_image(weather_text)
    case @weather_text.downcase
    when /clear/
      "sunny.jpg"
    when /cloud/
      "cloudy.jpg"
    when /rain/
      "rainy.jpg"
    when /snow/
      "snowy.jpg"
    else
      "default.jpg"
    end
  end
end
