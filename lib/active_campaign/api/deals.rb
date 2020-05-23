# frozen_string_literal: true

module ActiveCampaign
  module API
    #
    # Interface to deal endpoints
    #
    # @author Mikael Henriksson <mikael@mhenrixon.com>
    #
    module Deals
      # rubocop:disable Layout/LineLength
      #
      # Create a new deal
      #
      # @param [Hash] params create a new deal with this data
      # @option params [String] :name the name of the deal
      # @option params [String] :deal_url the address of the deals website
      # @option params [String] :title title of the deal (required).
      # @option params [String] :description description of the deal
      # @option params [String] :deal deal id for the deal
      # @option params [String] :contact primary contact's id for the deal.
      # @option params [Integer] :value value in cents. (i.e. $456.78 => 45678). Must be greater than or equal to zero. (required)
      # @option params [String] :currency currency in 3-digit ISO format, lowercased (required).
      # @option params [String] :group pipeline id. Required if deal.stage is not provided. If deal.group is not provided, the stage's pipeline will be assigned to the deal automatically.
      # @option params [String] :stage stage id. Required if deal.group is not provided. If deal.stage is not provided, the deal will be assigned with the first stage in the pipeline provided in deal.group.
      # @option params [String] :owner owner id. Required if pipeline's auto-assign option is disabled.
      # @option params [Integer] :percent percentage.
      # @option params [Integer] :status status.
      #
      # @return [Hash] a hash with information about the newly created deal
      #
      # rubocop:enable Layout/LineLength
      def create_deal(params)
        post('deals', deal: params)
      end

      #
      # Get a single deal
      #
      # @param [Integer] id the id of a deal to show
      #
      # @return [Hash]
      #
      def show_deal(id)
        get("deals/#{id}")
      end

      #
      # Get a list of deals
      #
      # @param [String] search Filter deals that match the given value in the deal attributes
      #
      # @return [Array<Hash>]
      #
      def show_deals(search = nil)
        get('deals', search: search)
      end

      # rubocop:disable Layout/LineLength
      #
      # Update an existing deal with given id
      #
      # @param [String] id the id of a deal to update
      # @param [Hash] params update an existing deal with this data
      # @option params [String] :name the name of the deal
      # @option params [String] :deal_url the address of the deals website
      # @option params [String] :title title of the deal (required).
      # @option params [String] :description description of the deal
      # @option params [String] :deal deal id for the deal
      # @option params [String] :contact primary contact's id for the deal.
      # @option params [Integer] :value* value in cents. (i.e. $456.78 => 45678). Must be greater than or equal to zero. (required)
      # @option params [String] :currency currency in 3-digit ISO format, lowercased (required).
      # @option params [String] :group pipeline id. Required if deal.stage is not provided. If deal.group is not provided, the stage's pipeline will be assigned to the deal automatically.
      # @option params [String] :stage stage id. Required if deal.group is not provided. If deal.stage is not provided, the deal will be assigned with the first stage in the pipeline provided in deal.group.
      # @option params [String] :owner owner id. Required if pipeline's auto-assign option is disabled.
      # @option params [Integer] :percent percentage.
      # @option params [Integer] :status status.
      #
      # @return [Hash] a hash with information about the newly created deal
      #
      # rubocop:enable Layout/LineLength
      def update_deal(id, params)
        put("deals/#{id}", deal: params)
      end

      #
      # Deletes a deal with given id
      #
      # @param [String] id the id of a deal to delete
      #
      # @return [Hash]
      #
      def delete_deal(id)
        delete("deals/#{id}")
      end
    end
  end
end
