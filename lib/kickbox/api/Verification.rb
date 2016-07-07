module Kickbox

  module Api

    #
    class Verification

      def initialize(api_key, client)
        @api_key = api_key

        if @api_key == nil
          raise 'Invalid api_key'
        end

        @client = client
      end

      # Email Verification
      #
      # '/verify' GET
      #
      # email - Email address to verify
      def verify(email, options = {})
        body    = options.fetch("query", {})
        timeout = options.fetch("timeout", 6000)

        body[:email] = email
        body[:timeout] = timeout
        body[:api_key] = @api_key

        @client.get("/verify", body, options)
      end

    end

  end

end
