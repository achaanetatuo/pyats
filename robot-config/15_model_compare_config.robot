# Compare Config Models
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

# Dallas Compare Configuration
DAL Current Running Configuration
    Profile the system for "config" on devices "DAL" as "./DAL_current_config"
DAL Change Configuration
    configure "ip route vrf cust10_pepsi 90.1.1.0 255.255.255.255 100.100.100.1" on device "DAL"
DAL New Running Configuration
    Profile the system for "config" on devices "DAL" as "./DAL_new_config"  
Compare Current and New Snapshots Dallas
    Compare profile "./DAL_current_config" with "./DAL_new_config" on devices "DAL"

# Disconnect from all the devices
Disconnect
  disconnect from all devices
