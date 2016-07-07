require "faraday"
require "json"

require "kickbox/api/Verification"
require "kickbox/api/Authentication"

module Kickbox

  class Client

    def initialize(auth = {}, options = {})
      @http_client = Kickbox::HttpClient::HttpClient.new(auth, options)
    end

    # Verify an Email Address
    #
    # api_key - Your Kickbox API key
    def Verification(api_key)
      Kickbox::Api::Verification.new(api_key, @http_client)
    end

    # Kickbox Confirmation Api
    #
    # app_code - The code for the authentication app to send the authentication email from
    # api_key - Your Kickbox API key
    def Authentication(app_code, api_key)
      Kickbox::Api::Authentication.new(app_code, api_key, @http_client)
    end

  end

end
