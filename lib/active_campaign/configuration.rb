# frozen_string_literal: true

module ActiveCampaign
  class Configuration
    API_ENDPOINT ||= 'https://subdomain.activehosted.com/admin/api.php'
    USER_AGENT   ||= "ActiveCampaign Ruby Gem #{ActiveCampaign::VERSION}"
    API_OUTPUT   ||= 'json'

    attr_accessor :api_key, :api_endpoint, :api_output, :user_agent,
                  :log, :logger, :log_level, :mash, :debug

    def initialize
      @api_key = nil
      @api_endpoint = API_ENDPOINT
      @api_output = API_OUTPUT
      @user_agent = USER_AGENT
      @log = false
      @logger = nil
      @log_level = :info
      @mash = false
      @debug = false
    end

    def to_h
      {
        api_key: api_key,
        api_endpoint: api_endpoint,
        api_output: api_output,
        user_agent: user_agent,
        log: log,
        logger: logger,
        log_level: log_level,
        mash: mash,
        debug: debug
      }
    end

    def merge(other_config = {})
      other_config.to_h.each do |k, v|
        send("#{k}=", v) if respond_to?(k)
      end
      self
    end

    def ==(other)
      other.is_a?(ActiveCampaign::Configuration) &&
        all_api_info_equal &&
        user_agent == other.user_agent &&
        all_log_info_equal &&
        mash == other.mash &&
        debug == other.debug
    end
    alias eql? ==

    def hash
      [
        api_key,
        api_endpoint,
        api_output,
        user_agent,
        log,
        logger,
        log_level,
        mash,
        debug,
        ActiveCampaign::Configuration
      ].hash
    end

    private

    def all_api_info_equal
      api_key == other.api_key &&
        api_endpoint == other.api_endpoint &&
        api_output == other.api_output
    end

    def all_log_info_equal
      log == other.log &&
        logger == other.logger &&
        log_level == other.log_level
    end
  end
end
