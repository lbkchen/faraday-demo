class ApiClient
  BASE_URL = "https://api.duckduckgo.com"

  def initialize
    @connection = Faraday.new(url: BASE_URL) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
      faraday.headers['Content-Type'] = 'application/json'
    end
  end

  def topic_search(topic)
    response = @connection.get '/', {
      q: topic,
      format: "json",
      skip_disambig: 1,
    }
    JSON.parse response.body
  end
end
