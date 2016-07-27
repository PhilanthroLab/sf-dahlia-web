module SalesforceService
  # encapsulate all Salesforce Listing querying functions
  class ListingService < SalesforceService::Base
    # get all open listings or specific set of listings by id
    # `ids` is a comma-separated list of ids
    def self.listings(ids = nil)
      params = ids.present? ? { ids: ids } : nil
      api_get('/ListingDetails', params)
    end

    # get listings with eligibility matches applied
    # filters:
    #  householdsize: n
    #  incomelevel: n
    #  childrenUnder6: n
    def self.eligible_listings(filters)
      results = api_get('/ListingDetails', filters)
      # sort the matched listings to the top of the list
      # TODO: replace with sorting on the JS side
      results.partition { |i| i['Does_Match'] }.flatten
    end

    # get one detailed listing result by id
    def self.listing(id)
      api_get("/ListingDetails/#{id}").first
    end

    # get all units for a given listing
    def self.units(listing_id)
      api_get("/Listing/Units/#{listing_id}")
    end

    # get AMI
    def self.ami(percent = 100)
      results = api_get("/ami?percent=#{percent}")
      results.sort_by { |i| i['numOfHousehold'] }
    end

    # get LotteryPreferences
    def self.lottery_preferences
      # TODO: cache?
      api_get('/LotteryPreference')
    end

    # get Lottery Results (aka Lottery_Members)
    def self.lottery_results(listing_id)
      api_get("/LotteryMember/#{listing_id}")
    end

    # get Lottery Buckets with rankings
    def self.lottery_buckets(listing_id)
      api_get("/Listing/LotteryResult/Bucket/#{listing_id}", nil, false)
    end

    # get Individual Lottery Result with rankings
    def self.lottery_ranking(listing_id, lottery_number)
      endpoint = "/Listing/LotteryResult/#{listing_id}/#{lottery_number}"
      api_get(endpoint, nil, false)
    end

    def self.check_household_eligibility(listing_id, params)
      endpoint = "/Listing/EligibilityCheck/#{listing_id}"
      %i(household_size incomelevel).each do |k|
        params[k] = params[k].to_i if params[k].present?
      end
      api_get(endpoint, params, nil, false)
    end

    ## override to parse_response default = true which we use for Listings
    def self.api_get(endpoint, params = nil, parse_response = true)
      api_call(:get, endpoint, params, parse_response)
    end
  end
end
