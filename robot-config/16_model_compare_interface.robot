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
${CONFIG}     /Users/chandranath/myfolder/autolearn/robot/loopback7777.cfg
# ${PTS}         /path/file

*** Test Cases ***
# Creating test cases from available keywords.


Connect
    use testbed "${testbed}"
    connect to devices "DAL"
    connect to devices "NY"

# Dallas Compare Configuration
DAL Current Interface Configuration
    Profile the system for "interface" on devices "DAL" as "./DAL_current_interface"
DAL Change Configuration
    ${configuration}=  get file  ${CONFIG}
    configure "${configuration}" on device "DAL"
    ${output}=  execute "write" on device "DAL"
    execute "show run interface loopback7777 " on device "DAL"
DAL New Interface Configuration
    Profile the system for "interface" on devices "DAL" as "./DAL_new_interface"  
Compare Current and New Interfaces Details in Dallas
    Compare profile "./DAL_current_interface" with "./DAL_new_interface" on devices "DAL"

# Disconnect from all the devices
Disconnect
  disconnect from all devices
