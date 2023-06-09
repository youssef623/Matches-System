# Matches-System
web application with a user interface that connects to an database that was implemented using SQL
# System Requirements
This section describes the different requirements that the platform has to include.
## Sports Association Manager
First of all, the association manager (which has an ID and name) can manage (create, edit or delete) the matches that will be played by the different clubs.
## Matches
Matches will be played by exactly two Clubs. One of them is considered the host of the match. Each game has an ID, starting time, ending time and allowed number of attendees. Also, each match will be hosted on exactly one stadium.
## Clubs
Each club (which has an ID, name and location) can play many matches through the season. The club will also have a representative (with a name and ID). who will be responsible for asking for the permission to host the matches played by the club he is representing when the club is the host of that match.
## Stadiums
Stadiums (which have an ID, name, capacity, location and status) are there to host the games. The status of the stadium can be either available or not available. Each stadium has a manager (who has a name and ID) who is in charge for approving or disapproving the different club requests for hosting their matches on the stadium he is managing .
## Tickets
Once the stadium manager approves hosting a certain game, tickets will be available for the fans to buy and attend the game. Each ticket has an ID, a stadium where the match is hosted on and a status that can either be sold or available. The system keeps track about which users bought which tickets.
## Fans
Fans (who have name, national ID number, birth date, address and phone number) can buy tickets to attend the matches. For some cases, a fan can temporarily be blocked from using the system.
## System Admin
The system admin is the one who can add or delete clubs, add or delete stadiums, add or delete and temporarily block fans from using the system.
## General Note
All different users who use the system will have a user name and a password that they will need to enter to be able to use the system.
