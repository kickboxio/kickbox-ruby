module Kickbox

  module Api

    # Kickbox Authentication Api
    #
    # app_code - The code for the authentication app to send the authentication email from.
    # api_key  - Your Kickbox API key.
    class Authentication

      def initialize(app_code, api_key, client)
        @app_code = app_code
        @api_key = api_key
        @client = client

        if @app_code == nil
          raise "Invalid app_code"
        end
        if @api_key == nil
          raise "Invalid api_key"
        end

      end

      # Sends the authentication email.
      #
      # POST '/authenticate/:app_code'
      #
      # fingerprint - The fingerprint retrieved from `Kickbox.fingerprint` for the email address you wish to send the authentication email to.
      def authenticate(fingerprint, options = {})
        body = options.fetch(:body, {})
        body[:fingerprint] = fingerprint
        body[:api_key] = @api_key

        @client.POST("/authenticate/#{@app_code}", body, options)
      end

      # Reports the status of an authentication email.
      #
      # GET '/v2/authenticate/:app_code/:id'
      #
      # id - The authentication `id` retrieved from the Authenticate API request.
      def get_status(id, options = {})
        body = options.fetch(:query, {})
        body[:api_key] = @api_key

        @client.get("/authenticate/#{@app_code}/#{id}", body, options)
      end

    end

  end

end
