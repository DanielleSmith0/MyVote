_MyVote_ is a mobile iOS app, made with XCode/Swift. The views are made entirely through SwiftUI. With a very emotionally charged election day coming up, the purpose of the app is so the user can easily received a basic, unbiased overview of the political stances of all the U.S. Presidential candidates, not just the arguments between the main two candidates. 
The list of candidates is retreived with Python through a government API, narrowed doen to candidates that have put expendatures into their campaign. This is to weed out the hundreds of candidates that were signed up as just a statement or joke. It is then held on a supercomputer server for the app to make requests to, so it does not have to hold all of the information all of the time. However, we plan to eventully move the data to AWS when the app is complete and on the app store.