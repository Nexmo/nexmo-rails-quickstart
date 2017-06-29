# Nexmo APIs Quickstart Examples for Ruby on Rails

The purpose of the quickstart guide is to provide simple examples focused on one goal. For example, sending an SMS, handling an incoming SMS webhook or making a Text to Speech call.

## Configure with Your Nexmo API Keys

To use this sample you will first need a [Nexmo account](https://dashboard.nexmo.com/sign-up). Once you have your own API credentials, rename the `.env.example` file to `.env` and set the values as required.

For some of the examples you will need to [buy a number](https://dashboard.nexmo.com/buy-numbers).

## Tutorials & Sample Code

### SMS

Tutorial                                                       | Code Sample
-------------------------------------------------------------- | ----------------------------------------------------------------------------------
[How to Send SMS Messages with Ruby on Rails](#)               | [outbound_sms_controller.rb](app/controllers/outbound_sms_controller.rb)
[How to Receive SMS Messages with Ruby on Rails](#)            | [inbound_sms_controller.rb](app/controllers/receive-inbound_sms_controller.rb)
[How to receive an SMS Delivery Receipt with Ruby on Rails](#) | [delivery_receipts_controller.rb](app/controllers/delivery_receipts_controller.rb)

### Voice

Tutorial                                                                               | Code Sample
-------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------
[How to Make an Outbound Text-to-Speech Phone Call with Ruby on Rails](#)              | [outbound_call_controller.rb](app/controllers/outbound_call_controller.rb)
[How to Handle Inbound Phone Calls with Ruby on Rails](#)                              | [inbound_call_controller.rb](app/controllers/inbound_call_controller.rb)
[How to Direct Inbound Phone Calls to an Endpoint with Failover with Ruby on Rails](#) | [direct_inbound_call_controller.rb](app/controllers/direct_inbound_call_controller.rb)
[How to Record Audio from Incoming Calls with Ruby on Rails](#)                        | [record_inbound_call_controller.rb](app/controllers/record_inbound_call_controller.rb)
[How to Make a Private Phone Call with Ruby on Rails](#)                               | [private_call_controller.rb](app/controllers/private_call_controller.rb)

### Verify

Tutorial                  | Code Sample
------------------------- | -----------
Two-Factor Authentication | TBD

## Request More Examples

Please [raise an issue](/../../issues/) to request an example that isn't present within the quickstart. Pull requests will be gratefully received.

## Licenses

- The code samples in this repo is under [MIT](LICENSE)

- The tutorials contents are under Creative Commons, [CC-BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/legalcode)

  ​
