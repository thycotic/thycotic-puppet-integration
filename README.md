# Thycotic Secret Server Puppet Module

This is a puppet module that works with the Thycotic SDK ruby gem to facilitate the connection to the Thycotic Secret Server

### Prerequisites
| Environment | Version |
| ------ | ------ |
| Ruby | 2.4* |
| Puppet | 5.* |
| Thycotic Secret Server Ruby gem installed in Puppet Server and/or the environment | |



Installing the Thycotic Secret Server Ruby gem in Puppet Server
```
sudo puppetserver gem install secret_server --no-ri --no-rdoc
```

## Built With

To build the project, use the following command
```
puppet module build <MODULE DIRECTORY>
```

## Deployment

To deploy the module, assuming that you're running puppet in the traditional way (agent/master), install the module on your puppet server
```
puppet module install <absolute path of module>
```
The module has the stdlib module as its dependency and will automatically install when the module gets installed.

To use in puppet agent, make sure to include the module after it's installed
```
node 'fqdn of client' {
  include thycotic
}
```

##Functions for Puppet from the Module

This module exposes the following functions from the Thycotic Secret Server Ruby gem to extract secrets:

To configure the connection to Thycotic Secret Server
```
thycotic::configure(path, url, rulename, rulekey)
```
The parameters are all String. Once the connections has been established, the configuration is cached by the agent by default unless specified otherwise
If you need to change the configuration, make sure to reboot the puppet server first before running the function again to clear the agent cache.

To remove the configuration
```
thycotic::remove_config
```

To set the cache strategy and age
```
thycotic::set_cache(cache_strategy, cache_age)
```
Both "cache_strategy" and "cache_age" are Integers. "cache_strategy" takes values from 0 - 3 depending on the strategy (please refer to the Thycotic SDK manual for more information of each strategy) and "cache_age" is measured in minutes

To grab the secret with a specified field name
```
thycotic::get_secret(id, fieldnameslug)
```
Parameter "id" is Integer and "fieldnameslug" is slug String of the field name. It returns the string of the field of the provided secret.


## Authors

Paulo Dorado

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

Thycotic Secret Server Gem
