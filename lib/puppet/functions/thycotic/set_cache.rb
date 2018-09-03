require 'secret_server'

Puppet::Functions.create_function(:'thycotic::set_cache') do
  dispatch :set_cache do
    param 'Integer', :cache_strategy
    param 'Integer', :cache_age
    return_type 'String'
  end

  def set_cache(cache_strategy, cache_age)
    SecretServer.cache_strategy = [cache_strategy, cache_age]

    strat = case cache_strategy
            when 0 then "Never Cache"
            when 1 then "Server Then Cache"
            when 2 then "Cache Then Server"
            when 3 then "Cache Then Server Fallback on Expired Cache"
            end

    return strat + " for " + cache_age.to_s + " minute(s)"
  end
end
