# Shut and Unshut BGP Peer
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
@{bgpshut}      10.1.1.0
# ${PTS}         /path/file

*** Test Cases ***
# Creating test cases from available keywords.

Connect
    use testbed "${testbed}"
    connect to devices "DAL"
    connect to devices "NY"

Shut BGP Peer
    execute "show ip route vrf cust20_pepsi" on device "NY"
    execute "show run | sec bgp" on device "NY"
    configure shut bgp neighbors    bgp_as=65010      address_family=ipv4    vrf=cust20_pepsi  device=NY   neighbors=@{bgpshut}
    execute "show run | sec bgp" on device "NY"
    Sleep   10
    execute "show ip route vrf cust20_pepsi" on device "NY"
    
UnShutdown BGP Peer
    configure shut bgp neighbors    bgp_as=65010      address_family=ipv4    vrf=cust20_pepsi  device=NY   neighbors=@{bgpshut}   noshut=True
    execute "show run | sec bgp" on device "NY"
    Sleep   10
    execute "show ip route vrf cust20_pepsi" on device "NY"

# Disconnect from all the devices
Disconnect
  disconnect from all devices
