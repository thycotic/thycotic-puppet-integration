require 'secret_server'

Puppet::Functions.create_function(:'thycotic::remove_config') do
  def remove_config()
    SecretServer.remove!
  end
end