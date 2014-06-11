module Kickbox

  module Api

    #
    class Kickbox

      def initialize(client)
        @client = client
      end

      # Email Verification
      #
      # '/verify?email=:email' GET
      #
      # email - Email address to verify
      def verify(email, options = {})
        body = options.fetch(:query, {})

        email = CGI::escape(email)

        @client.get("/verify?email=#{email}", body, options)
      end

    end

  end

end
