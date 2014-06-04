module Kickbox

  module HttpClient

    # RequestHandler takes care of encoding the request body into format given by options
    class RequestHandler

      def self.set_body(options)
        type = options.fetch(:request_type, "raw")

        # Raw body
        if type == "raw"
          options[:body] = options[:body].is_a?(Hash) ? "" : options[:body]
          options[:headers].delete("content-type")
        end

        return options
      end

    end

  end

end
