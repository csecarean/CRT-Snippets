*** Settings ***
Documentation             Salesforce leads test Faker Library
Resource                  ../resources/common.robot
Suite Setup               Setup Browser
Suite Teardown            End Suite

*** Variables ***


*** Test Cases ***
Create Salesforce lead FakerLibrary
    [Documentation]       Salesforce lead creation with Unique Data using Faker Library
    [Tags]                Leads
    Create Lead

Delete Salesforce Leads
    [Documentation]       To delete a SF Lead
    [Tags]                Leads
    Delete Lead

*** Keywords ***

Create Lead
    ${date} =             Get Current Date
    ${first_name}=        FakerLibrary.First Name
    ${last_name}=         FakerLibrary.Last Name
    ${company}=           FakerLibrary.Company
    ${email}=             FakerLibrary.Email
    ${phone}=             FakerLibrary.Phone Number
    ${street}=            FakerLibrary.Street Address
    ${city}=              FakerLibrary.City
    ${zipcode}=           FakerLibrary.Zip

    Home
    ClickText             Leads
    ClickText             New
    UseModal              On
    TypeText              First Name                  ${first_name}${date}
    TypeText              Last Name                   ${last_name}
    TypeText              *Company                    ${company}
    TypeText              Phone                       ${phone}
    TypeText              Email                       ${email}
    TypeText              Street                      ${street}
    TypeText              City                        ${city}
    TypeText              Zip/Postal Code             DA0 01X
    TypeText              Country                     Ireland
    ClickText             Save                        partial_match=False
    UseModal              Off
    VerifyText            ${first_name}${date} ${last_name}
    #VerifyText            Laghghbwganoawgiwrgj\egaogto]awgjpogarw]aerwjgag0
    ${fullname}           Set Variable                ${first_name}${date} ${last_name}
    Set Suite Variable    ${promotedFullName}         ${fullname}                 #setting suite variable to be used in entire file

Delete Lead
    Home
    ClickText             Leads
    ClickText             ${promotedFullName}
    ClickText             Delete
    UseModal              On
    VerifyText            Delete Lead
    ClickText             Delete
    UseModal              Off