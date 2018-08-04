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
$conn = thycotic_sdk::configure('CS:\\TSS\\tss', 'http://10.0.30.32/SecretServer', 'TestSDK', 'Vr4plm1thar0nfGgEf53OGFjyZe5doqI0+101yA/2hQ=')

notify{ "Connection Status: $conn": }

$secret = secret::get_secret_field('4', 'password')
notify{ "Extracted secret: $secret":}