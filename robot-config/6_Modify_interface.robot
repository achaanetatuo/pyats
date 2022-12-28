# Shut and Unshut Interface
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


Shutdown NY Interface GigabitEthernet1
    shut interface                           interface=GigabitEthernet1        device=NY
    verify interface config shutdown         interface=GigabitEthernet1        device=NY

Unshutdown NY Interface GigabitEthernet1
    unshut interface                         interface=GigabitEthernet1        device=NY
    verify interface config shutdown         interface=GigabitEthernet1        device=NY


# Disconnect from all the devices
Disconnect
  disconnect from all devices
