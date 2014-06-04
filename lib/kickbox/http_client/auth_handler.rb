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
        if !@auth.empty?
          auth = get_auth_type
          flag = false

          if auth == HTTP_HEADER
            env = http_header(env)
            flag = true
          end

          if !flag
            raise StandardError.new "Unable to calculate authorization method. Please check"
          end
        else
          raise StandardError.new "Server requires authentication to proceed further. Please check"
        end

        @app.call(env)
      end

      # Calculating the Authentication Type
      def get_auth_type()

        if @auth.has_key?(:http_header)
          return HTTP_HEADER
        end

        return -1
      end

      # Authorization with HTTP header
      def http_header(env)
        env[:request_headers]["Authorization"] = "token #{@auth[:http_header]}"

        return env
      end

      def query_params(url)
        if url.query.nil? or url.query.empty?
          {}
        else
          Faraday::Utils.parse_query(url.query)
        end
      end

      def merge_query(env, query)
        query = query.update query_params(env[:url])

        env[:url].query = Faraday::Utils.build_query(query)

        return env
      end
    end

  end

end
