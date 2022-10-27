module Kickbox

  module HttpClient

    # ResponseHandler takes care of decoding the response body into suitable type
    class ResponseHandler

      def self.get_body(env)
        type = env.response_headers["content-type"] || ''

        # Response body is in JSON
        type.include?("json") ?
          return JSON.parse(body) :
          return env.body

      end

    end

  end

end
