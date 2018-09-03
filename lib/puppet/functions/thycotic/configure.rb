require 'secret_server'

Puppet::Functions.create_function(:'thycotic::configure') do
  dispatch :configure do
    param 'String', :path
    param 'String', :url
    param 'String', :rule
    param 'String', :key
    return_type 'Tuple'
  end

  def configure(path, url, rule, key)
    SecretServer.configure do |config|
      config.path = path
      config.url = url
      config.rule = rule
      config.key = key
    end

    SecretServer.remove!
    SecretServer.init!
  end

end