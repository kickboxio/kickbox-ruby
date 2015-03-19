<p align="center">
  <img src="https://static.kickbox.io/kickbox_github.png" alt="Kickbox Email Verification Service">
  <br>
</p>

# Email Verification Library for Ruby

Kickbox determines if an email address is not only valid, but associated with a actual user. Uses include:

* Preventing users from creating accounts on your applications using fake, misspelled, or throw-away email addresses.
* Reducing bounces by removing old, invalid, and low quality email addresses from your mailing lists.
* Saving money and projecting your reputation by only sending to real email users.

## Getting Started

To begin, hop over to [kickbox.io](http://kickbox.io) and create a free account. Once you've signed up and logged in, click on **API Settings** and then click **Add API Key**. Take note of the generated API Key - you'll need it to setup the client as explained below.

## Installation

Make sure you have [rubygems](https://rubygems.org) installed

```bash
$ gem install kickbox
```

#### Versions

Works with [ 1.8.6 / 1.8.7 / 1.9.1 / 1.9.2 / 1.9.3 / 2.0.0 / 2.1.0 / 2.1.1 ]

## Usage

```ruby
require "kickbox"

client   = Kickbox::Client.new('Your_API_Key_Here')
kickbox  = client.kickbox()
response = kickbox.verify("test@example.com")
```
#### Options

**timeout** `integer` (optional) - Maximum time, in milliseconds, for the API to complete a verification request. Default: 6000.

```ruby
# Example with options
response = kickbox.verify("test@example.com", { "timeout" => 60000 })
```

### Response information

A successful API call responds with the following values:

* **result** `string` - The verification result: `deliverable`, `undeliverable`, `risky`, `unknown`
* **reason** `string` - The reason for the result. Possible reasons are:
    * `invalid_email` - Specified email is not a valid email address syntax
    * `invalid_domain` - Domain for email does not exist
    * `rejected_email` - Email address was rejected by the SMTP server, email address does not exist
    * `accepted_email` - Email address was accepted by the SMTP server
    * `low_quality ` - Email address has quality issues that may make it a risky or low-value address
    * `low_deliverability ` - Email address appears to be deliverable, but deliverability cannot be guaranteed
    * `no_connect` - Could not connect to SMTP server
    * `timeout` - SMTP session timed out
    * `invalid_smtp` - SMTP server returned an unexpected/invalid response
    * `unavailable_smtp` - SMTP server was unavailable to process our request
    * `unexpected_error` - An unexpected error has occurred
* **role** `true | false` - *true* if the email address is a role address (`postmaster@example.com`, `support@example.com`, etc)
* **free** `true | false` - *true* if the email address uses a free email service like gmail.com or yahoo.com.
* **disposable** `true | false` - *true* if the email address uses a *disposable* domain like trashmail.com or mailinator.com.
* **accept_all** `true | false` - *true* if the email was accepted, but the domain appears to accept all emails addressed to that domain.
* **did_you_mean** `null | string` - Returns a suggested email if a possible spelling error was detected. (`bill.lumbergh@gamil.com` -> `bill.lumbergh@gmail.com`)
* **sendex** `float` - A quality score of the provided email address ranging between 0 (no quality) and 1 (perfect quality). More information on the Sendex Score can be found [here](http://docs.kickbox.io/v2.0/docs/the-sendex).
* **email** `string` - Returns a normalized version of the provided email address. (`BoB@example.com` -> `bob@example.com`)
* **user** `string` - The user (a.k.a local part) of the provided email address. (`bob@example.com` -> `bob`)
* **domain** `string` - The domain of the provided email address. (`bob@example.com` -> `example.com`)
* **success** `true | false` - *true* if the API request was successful (i.e., no authentication or unexpected errors occurred)

### Response headers

Along with each response, the following HTTP headers are included:

* `X-Kickbox-Balance` - Your remaining verification credit balance (Daily + On Demand).
* `X-Kickbox-Response-Time` - The elapsed time (in milliseconds) it took Kickbox to process the request.

## License
MIT

## Bug Reports
Report [here](https://github.com/kickboxio/kickbox-ruby/issues).

## Need Help?
help@kickbox.io
