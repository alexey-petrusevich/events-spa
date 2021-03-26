
Web Dev Spring 2021 HW08 Status

Answer the following questions:


1. What's your name?

Alexey Petrusevich


2. What's the URL of the github repo with your work for this HW?

https://github.com/alexey-petrusevich/events-spa


3. What's the URL that you deployed to?

http://events-spa.quickjohnny.art/


4. Is your app functionality complete? If not, what's missing?

Most of things are missing due to time constraints. Specifically, I got stuck with CORS for quite sometime.
While I've created all necessary resources and followed professor's lecture notes,
the only functionality working here is creating new users, and new events (sort of).
When creating event, the datetime (originally utc_datetime type) is not being checked,
and causes and error when creating it. However, event migration was updates such that it is not required
to be not null. In the end, the event is being created with date equals to nil (null).
Other functionality requested is missing.



5. Is your app properly deployed? If not, what went wrong?

Yes




And here's a list of tasks for grading comments. Just leave this here:
 - Development
 - Deployment
 - Submission
