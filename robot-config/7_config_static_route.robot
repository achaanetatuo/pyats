# Remove and Add Static Route
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

Remove Static Route
    execute "show ip route vrf cust20_pepsi" on device "NY"
    configure "no ip route vrf cust20_pepsi 10.1.1.0 255.255.255.255 100.100.100.0" on device "NY"
    Sleep   10
    execute "show ip route vrf cust20_pepsi" on device "NY"
Add Static Route
    configure "ip route vrf cust20_pepsi 10.1.1.0 255.255.255.255 100.100.100.0" on device "NY"
        Sleep   10
    execute "show ip route vrf cust20_pepsi" on device "NY"

# Disconnect from all the devices
Disconnect
  disconnect from all devices
