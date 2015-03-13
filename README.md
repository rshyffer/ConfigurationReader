# Configuration Reader
## Description
A Ruby class that can read the contents of a key = value configuration file and allow access to the settings.

## Usage
The configuration.rb file contains the Configuration class.  To use it, initialize the class with the file name of the configuration file.  

`config = Configuration.new('./exampleConfig.txt')`

Configuration settings are available through methods named for each configuration key:

`my_host_url = config.host`

Alternately, you can access the configuration through bracket notation passing the key:

`my_host_url = config[:host]`

## Contents

**configuration.rb** - The configuration reader class

**test_configuration.rb** - A test method to test the configuration reader.  To run the tests just load and run `test_configuration`

