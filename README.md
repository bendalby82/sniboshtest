# SNI BOSH Test
A set of test scripts for testing Gorouter upgrade performance when upgrades are occurring. Can be used generally, but were originally intended for testing Cloud Foundry's Multiple Certificate feature:  
https://docs.cloudfoundry.org/adminguide/securing-traffic.html#multcerts

## Usage

**test-routers.sh**    
https://github.com/bendalby82/sniboshtest/blob/master/test-routers.sh  

This script will continually poll your Gorouters. Should run from a VM that is on the same network as the Gorouters, so that traffic does not go through your load balancer.  

**test-lb.sh**   
https://github.com/bendalby82/sniboshtest/blob/master/test-lb.sh  

This script will continually poll your load balancer.  Can be run from anywhere with access to your foundation.  

**test-lb-verbose.sh**    
https://github.com/bendalby82/sniboshtest/blob/master/test-lb-verbose.sh  

Verbose version of the test-lb.sh script - useful if you detect problems with test-lb.sh, and want to see all the details.

## Hints

Note the use of the `--max-time` switch with the `curl` command - make sure you don't set this too low, or delays will be interpreted as failures.
