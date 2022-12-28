# Load and Save Configuration
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
${CONFIG}     /Users/chandranath/myfolder/autolearn/robot/loopback600.cfg
# ${PTS}         /path/file

*** Test Cases ***
# Creating test cases from available keywords.


Connect
    use testbed "${testbed}"
    connect to devices "DAL"
    connect to devices "NY"


Load and Save Configuration
    ${configuration}=  get file  ${CONFIG}
    configure "${configuration}" on device "DAL"
    ${output}=  execute "write" on device "DAL"
    execute "show run interface loopback600 " on device "DAL"


# Disconnect from all the devices
Disconnect
  disconnect from all devices
