require "faraday"
require "json"

require "kickbox/api/kickbox"

module Kickbox

  class Client

    def initialize(auth = {}, options = {})
      @http_client = Kickbox::HttpClient::HttpClient.new(auth, options)
    end

    # 
    def kickbox
      Kickbox::Api::Kickbox.new(@http_client)
    end

  end

end
