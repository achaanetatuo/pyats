# Show Interface Configuration
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


# Dallas Interface Configuration
DAL Interface Configuration
    execute "show ip interface brief" on device "DAL"
    execute "show Interface GigabitEthernet1" on device "DAL"

# Newyork Interface Configuration
NY Interface Configuration
    execute "show ip interface brief" on device "NY"
    execute "show Interface GigabitEthernet1" on device "NY"    

# Disconnect from all the devices
Disconnect
  disconnect from all devices
