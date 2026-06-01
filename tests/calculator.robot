*** Settings ***
Library    ../calculator.py

*** Test Cases ***
Verify Addition
    ${result}=    Add    2    3
    Should Be Equal As Integers    ${result}    5
