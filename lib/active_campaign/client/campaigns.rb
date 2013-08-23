module ActiveCampaign
  class Client
    module Campaigns
      CONTACT_METHODS = %w[
        create delete_list delete list paginator report_bounce_list
        report_bounce_totals report_forward_list report_forward_totals
        report_link_list report_link_totals report_open_list report_open_totals
        report_totals report_unopen_list report_unsubscription_list
        report_unsubscription_totals send status
      ]
      CONTACT_POST_METHODS = %w[create]

      extend ActiveSupport::Concern

      # TODO: Create proper methods with parameter validation and possible naming fixes since this is one the worst APIs I have ever worked with.
      included do
        CONTACT_METHODS.each do |method|
          define_method "campaign_#{method}" do |options|
            if CONTACT_POST_METHODS.include?(method)
              post __method__, options
            else
              get __method__, options
            end
          end
        end
      end
    end
  end
end

# contact_sync - parameters
# email             - Email of the new subscriber. Example: 'test@example.com'
# first_name        - First name of the subscriber. Example: 'FirstName'
# last_name         - Last name of the subscriber. Example: 'LastName'
# ip4               - IP address of the subscriber. Example: '127.0.0.1' If not supplied, it will default to '127.0.0.1'
# field[345,0]      - Custom field values. Example: field[345,0] = 'value'. In this example, "345" is the field ID. Leave 0 as is.
# field[%PERS_1%,0] - 'value' (You can also use the personalization tag to specify which field you want updated)
#               - Assign to lists. List ID goes in brackets, as well as the value.
# status[123]       - The status for each list the subscriber is added to. Examples: 1 = active, 2 = unsubscribed
# form              - Optional subscription Form ID, to inherit those redirection settings. Example: 1001. This will allow you to mimic adding the subscriber through a subscription form, where you can take advantage of the redirection settings.
# noresponders[123] - Whether or not to set "do not send any future responders." Examples: 1 = yes, 0 = no.
# sdate[123]        - Subscribe date for particular list - leave out to use current date/time. Example: '2009-12-07 06:00:00'
# instantresponders[123]  Use only if status = 1. Whether or not to set "send instant responders." Examples: 1 = yes, 0 = no.
# lastmessage[123]  - Whether or not to set "send the last broadcast campaign." Examples: 1 = yes, 0 = no.
# "field[%BALANCE%,0]": "100"