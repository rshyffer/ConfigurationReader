# Configuration Reader
## Description
A Ruby class that can read the contents of a key = value configuration file and allow access to the settings.  

Note that all boolean-type values (yes/no, on/off, true/false) are converted to actual booleans.  In addition all integers and floats will be converted from strings to numbers.

## Usage
The configuration.rb file contains the Configuration class.  To use it, initialize the class with the path to the configuration file.  

`config = Configuration.new('./exampleConfig.txt')`

Configuration settings are available through methods named for each configuration key:

`my_host_url = config.host`

Alternately, you can access the configuration through bracket notation passing the key:

`my_host_url = config[:host]`

All configuration values can be accessed using the values method as well:

`my_host_url = config.values[:host]`

## Contents

**configuration.rb** - The configuration reader class

**test_configuration.rb** - A test method to test the configuration reader.  To run the test run `test_configuration`

