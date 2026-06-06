*** Settings ***
Library    ../calculator.py

*** Test Cases ***
Verify Addition
    ${result}=    Add    2    3
    Should Be Equal As Integers    ${result}    5

    ${result}=    Add    2    4
    Should Be Equal As Integers    ${result}    6