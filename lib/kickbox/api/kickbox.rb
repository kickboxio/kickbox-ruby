module Kickbox

  module Api

    #
    class Kickbox

      def initialize(client)
        @client = client
      end

      # Email Verification
      #
      # '/verify?email=:email&timeout=:timeout' GET
      #
      # email - Email address to verify
      def verify(email, options = {})
        body    = options.fetch("query", {})
        timeout = options.fetch("timeout", 6000)

        email = CGI::escape(email)

        @client.get("/verify?email=#{email}&timeout=#{timeout}", body, options)
      end

    end

  end

end
