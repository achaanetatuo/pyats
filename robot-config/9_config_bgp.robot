# Configure BGP
** Settings ***
Library        OperatingSystem
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        genie.metaparser
Library        genie.libs.parser
Library        genie.libs.robot.GenieRobotApis
Library        unicon.robot.UniconRobot



*** Variables ***
# Defining variables that can be used elsewhere in the test data.
# Can also be driven as dash argument at runtime

${testbed}    tb-jump.yaml
# ${PTS}         /path/file

*** Test Cases ***
# Creating test cases from available keywords.


Connect
    use testbed "${testbed}"
    connect to devices "DAL"
    connect to devices "NY"


Configure New BGP Peer
     execute "show run | sec bgp" on device "DAL"
     configure "router bgp 65000\r address-family ipv4 vrf cust60\r neighbor cust-0060 peer-group\r neighbor cust-0060 remote-as 65060 " on device "DAL"
     configure "router bgp 65000\r address-family ipv4 vrf cust60\r neighbor cust-0060 ebgp-multihop 2\r neighbor cust-0060 password bgp123 " on device "DAL"
     configure "router bgp 65000\r address-family ipv4 vrf cust60\r neighbor 10.1.1.16 peer-group cust-0060\r neighbor 10.1.1.16 activate " on device "DAL"
     configure "router bgp 65000\r address-family ipv4 vrf cust60\r neighbor 10.1.1.16 description ** cust-0060-bgp-a ** " on device "DAL"
     execute "show run | sec bgp" on device "DAL"

# Disconnect from all the devices
Disconnect
  disconnect from all devices
