# The baseline for module testing used by Puppet Inc. is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation
# errors and view a log of events) or by fully applying the test in a virtual
# environment (to compare the resulting system state to the desired state).
#
# Learn more about module testing here:
# https://puppet.com/docs/puppet/latest/bgtm.html#testing-your-module
#
include ::thycotic
$conn = thycotic_sdk::configure('<path-to-sdk>', 'http://<secret-server-url>/SecretServer', '<rule-name', '<rule-key>')

notify{ "Connection Status: $conn": }

$secret = secret::get_secret_field('<secret-id>', '<field-name-or-slug>')
notify{ "Extracted secret: $secret":}