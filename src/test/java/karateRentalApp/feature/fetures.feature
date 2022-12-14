Feature: Check the Rental api
    
  Scenario: verify the get request for status
   Given url "https://simple-tool-rental-api.glitch.me/status"
   When method get
   Then status 200

 Scenario: verify  the get requests for tools with positive scenarios
Given url "https://simple-tool-rental-api.glitch.me/tools?available=true&results=10"
When method get
Then status 200



 Scenario Outline: verify all the get for tools requests with negative scenarios 
Given url '<url>'
When method get
Then status 400

Examples:  
|url|                                                                   
|https://simple-tool-rental-api.glitch.me/tools?available=true&results=100|
|https://simple-tool-rental-api.glitch.me/tools?available=true&results=-1

 
 
Scenario: verify all the get requests for toolid
Given url "https://simple-tool-rental-api.glitch.me/tools/4643"
When method get
Then status 200

Scenario: verify all the get requests for toolid with negative scenario
Given url "https://simple-tool-rental-api.glitch.me/tools/464"
When method get
Then status 404



Scenario: verify post requests for client creation
Given url "https://simple-tool-rental-api.glitch.me/api-clients"
And request {clientName: 'Postman',clientEmail: 'bkm1@example.com'}
When method post
Then status 201

Scenario: verify post requests for client creation
Given url "https://simple-tool-rental-api.glitch.me/api-clients"
And request {clientName: 'Postman',clientEmail: 'bkm11@example.com'}
When method post
Then status 201

Scenario: verify get requests for client order details
Given url "https://simple-tool-rental-api.glitch.me/orders"
And header Authorization='08bcfd299259227f04f408a82580be745945f05b0f087da9cb268c1608ea8f73'
When method get
Then status 200
