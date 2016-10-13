module Kickbox

  module HttpClient

    # ResponseHandler takes care of decoding the response body into suitable type
    class ResponseHandler

      def self.get_body(env)
        type = env.response_headers["content-type"] || ''
        body = env.body

        # Response body is in JSON
        if type.include?("json")
          body = JSON.parse body
        end

        return body
      end

    end

  end

end
