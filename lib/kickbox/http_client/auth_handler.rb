require "base64"

module Kickbox

  module HttpClient

    # AuthHandler takes care of devising the auth type and using it
    class AuthHandler < Faraday::Middleware

      def initialize(app, auth = {}, options = {})
        @auth = auth
        super(app)
      end

      def call(env)
        if !@auth.empty?
          auth = get_auth_type
          flag = false

          if !flag
            raise StandardError.new "Unable to calculate authorization method. Please check"
          end
        end

        @app.call(env)
      end

      # Calculating the Authentication Type
      def get_auth_type()

        return -1
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
