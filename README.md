# Nexmo APIs Quickstart Examples for Ruby on Rails

The purpose of the quickstart guide is to provide simple examples focused on one goal. For example, sending an SMS, handling an incoming SMS webhook or making a Text to Speech call.

## Configure with Your Nexmo API Keys

To use this sample you will first need a [Nexmo account](https://dashboard.nexmo.com/sign-up). Once you have your own API credentials, rename the `.env.example` file to `.env` and set the values as required.

For some of the examples you will need to [buy a number](https://dashboard.nexmo.com/buy-numbers).

## Setup

$ git clone git@github.com:Nexmo/nexmo-rails-quickstart.git
$ cd nexmo-rails-quickstart
$ cp .env.example .env
$ bundle install
$ rake db:create
$ rake db:migrate
$ rails server

## Tutorials & Sample Code

### SMS

Tutorial                                                                                                                                                        | Code Sample
--------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------
[How to Send SMS Messages with Ruby on Rails](https://github.com/workbetta/nexmo-rails-quickstart-tutorials/tree/master/sms-send.md)                            | [outbound_sms_controller.rb](app/controllers/outbound_sms_controller.rb)
[How to receive an SMS Delivery Receipt with Ruby on Rails](https://github.com/workbetta/nexmo-rails-quickstart-tutorials/tree/master/sms-delivery-receipts.md) | [sms_delivery_receipts_controller.rb](app/controllers/sms_delivery_receipts_controller.rb)
[How to Receive SMS Messages with Ruby on Rails](https://github.com/workbetta/nexmo-rails-quickstart-tutorials/tree/master/sms-receive.md)                      | [inbound_sms_controller.rb](app/controllers/inbound_sms_controller.rb)

### Voice

Tutorial                                                                                                                                                           | Code Sample
------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------
[How to Make an Outbound Text-to-Speech Phone Call with Rails](https://github.com/workbetta/nexmo-rails-quickstart-tutorials/tree/master/calls-make-outbound.md)   | [outbound_calls_controller.rb](app/controllers/outbound_calls_controller.rb)
[How to receive an Call Event webhook with Ruby on Rails](https://github.com/workbetta/nexmo-rails-quickstart-tutorials/tree/master/calls-receive-event-update.md) | [call_events_controller.rb](app/controllers/call_events_controller.rb)
[How to Handle Inbound Phone Calls with Ruby on Rails](https://github.com/workbetta/nexmo-rails-quickstart-tutorials/tree/master/calls-receive-inbound.md)         | [inbound_calls_controller.rb](app/controllers/inbound_calls_controller.rb)

## Request More Examples

Please [raise an issue](/../../issues/) to request an example that isn't present within the quickstart. Pull requests will be gratefully received.

## Licenses

- The code samples in this repo is under [MIT](LICENSE)

- The tutorials contents are under Creative Commons, [CC-BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/legalcode)

  ​
