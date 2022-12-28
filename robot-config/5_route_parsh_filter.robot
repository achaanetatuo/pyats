# Parse and Filter IP Route
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

Parse and Filter Route output

    ${output} =    parse "show ip route vrf cust20_pepsi" on device "NY"
    Log    ${output}
    ${output2} =    Dq query    data=${output}  filters=contains('bgp').get_values('routes')
    Log    ${output2} 


# Disconnect from all the devices
Disconnect
  disconnect from all devices
