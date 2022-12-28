# Verify BGP
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

Verify BGP Information
    verify count "2" "bgp routes" on device "NY"
    verify count "1" "bgp neighbors" on device "NY"


# Disconnect from all the devices
Disconnect
  disconnect from all devices
