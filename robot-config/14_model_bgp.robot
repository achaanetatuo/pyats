# BGP Model
** Settings ***
Library        OperatingSystem
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
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




# Dallas Model BGP
DAL Model BGP
    Profile the system for "bgp" on devices "DAL" as "./DAL_base_config"

# Newyork Model BGP
NY Model BGP
    Profile the system for "bgp" on devices "DAL" as "./NY_base_config"    

# Disconnect from all the devices
Disconnect
  disconnect from all devices
