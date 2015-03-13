require './configuration.rb'

# Ultra simple test method to eliminate library dependencies.
def assert_equal(actual, expected)
  if actual != expected
    raise "Assert equal failed"
  end
end

def test_configuration
  c = Configuration.new('./exampleConfig.txt')

  #test_method_access
  assert_equal c.host, "test.com"
  assert_equal c.server_id, 55331
  assert_equal c.server_load_alarm, 2.5
  assert_equal c.user,	"user"
  assert_equal c.verbose, true
  assert_equal c.test_mode,	true
  assert_equal c.debug_mode,	false
  assert_equal c.log_file_path,	"/tmp/logfile.log"
  assert_equal c.send_notifications,	true

  #test_hash_access
  assert_equal c.values[:host], "test.com"
  assert_equal c.values[:server_id], 55331
  assert_equal c.values[:server_load_alarm], 2.5
  assert_equal c.values[:user],	"user"
  assert_equal c.values[:verbose], true
  assert_equal c.values[:test_mode],	true
  assert_equal c.values[:debug_mode],	false
  assert_equal c.values[:log_file_path],	"/tmp/logfile.log"
  assert_equal c.values[:send_notifications],	true

  print "All tests passed."
end