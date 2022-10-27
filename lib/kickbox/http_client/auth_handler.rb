require "base64"

module Kickbox

  module HttpClient

    # AuthHandler takes care of devising the auth type and using it
    class AuthHandler < Faraday::Middleware

      HTTP_HEADER = 1

      def initialize(app, auth = {}, options = {})
        @auth = auth
        super(app)
      end

      def call(env)
        raise StandardError.new("Server requires authentication to proceed further. Please check") if @auth.empty?

        if get_auth_type == HTTP_HEADER
          env = http_header(env)
        end

        @app.call(env)
      end

      # Calculating the Authentication Type
      def get_auth_type
        if @auth.has_key?(:http_header)
          HTTP_HEADER
        else
          raise StandardError.new("Unable to calculate authorization method. Please check")
        end
      end

      # Authorization with HTTP header
      def http_header(env)
        env[:request_headers]["Authorization"] = "token #{@auth[:http_header]}"

        env
      end

      def query_params(url)
        if url.query.nil? or url.query.empty?
          {}
        else
          Faraday::Utils.parse_query(url.query)
        end
      end

      def merge_query(env, query)
        query = query.update(query_params(env[:url]))

        env[:url].query = Faraday::Utils.build_query(query)

        env
      end
    end

  end

end
