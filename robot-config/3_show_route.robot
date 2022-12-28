# View Routing Table
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




# Dallas Routing Table
DAL Routing Table
    execute "show ip route" on device "DAL"

# Newyork Routing Table
NY Routing Table
    execute "show ip route" on device "NY"    

# Disconnect from all the devices
Disconnect
  disconnect from all devices
