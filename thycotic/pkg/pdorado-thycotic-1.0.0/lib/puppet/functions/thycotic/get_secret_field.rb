require 'secret_server'

Puppet::Functions.create_function(:'thycotic::get_secret_field') do
  dispatch :get_secret_field do
    param 'Integer', :id
    param 'String', :field
    return_type 'String'
  end

  def get_secret_field(id, field)
    SecretServer.secret(id, field: field)
  end
end