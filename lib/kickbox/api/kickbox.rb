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
        body = options.fetch("query", {})
        timeout = options.fetch("timeout", 6000)

        email = CGI::escape(email)

        @client.get("/verify?email=#{email}&timeout=#{timeout}", body, options)
      end

      # Email Batch Verification
      #
      # '/verify-batch' PUT
      #
      # emails - Email addresses to verify
      def verify_batch(emails, options = {})
        if options['headers'].blank?
          options['headers'] = {}
        end

        date = Time.current.strftime('%m-%d-%y %H-%M')
        options['headers'].merge!(
          'Content-Type' => 'text/csv',
          'X-Kickbox-Filename' => "Batch Email Verification #{date}"
        )

        emails = emails.join("\n")
        @client.put("/verify-batch", emails, options)
      end

      # Email Batch Verification Status
      #
      # '/verify-batch/:id' GET
      #
      # id - Job ID of the batch verification job
      def batch_status(id)
        @client.get("/verify-batch/#{id}")
      end

    end

  end

end
