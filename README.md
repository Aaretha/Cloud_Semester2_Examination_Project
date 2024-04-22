# Cloud_Semester2_Examination_Project
#### Purpose for this document  
Documentation of the steps taken with screenshots, including proof of the application’s accessibility (screenshots taken where necessary)  

### STEP 1: Uderstand the project/Design a solution  
At reception of the project, I sought to understand the project. After a little study time, I realised that deploying the LAMP stack is essentiall all that's further listed in the project objectives and the neccessary php extensions were the `php libapache2-mod-php` and `php-mysql`.  
For the _readability_ requirement, I use documentation with comments and for the _reusabilty_, my guess for this is through modularization and parametarization.

![assignment design](https://github.com/Aaretha/Cloud_Semester2_Examination_Project/assets/149208787/48ad98e3-984e-458d-814e-8e2d594aa0d2)  

### STEP 2: Implement the solution  
After understanding and walking through what needs to be done, I sought to implement the design which looked like understanding what commands fufills what requirements.  
**SCRIPT WITHOUT PARAMETERS**  
![script without parameters](https://github.com/Aaretha/Cloud_Semester2_Examination_Project/assets/149208787/5727e013-cd3c-4443-a1e3-3c4d00e68384)  

After testing the implementation of the script without using parameters, I introduced parameters - variables for the configuration of the Apache server, the MySQL(database) server and the Laravel application.
**SCRIPT WITH PARAMETERS**  
![script with parameters](https://github.com/Aaretha/Cloud_Semester2_Examination_Project/assets/149208787/9fa66aa8-eaac-462b-bbb8-6613796c2cbe)  

### STEP 3: Test implementation and reiterate through the process as necessary   

At this stage, I faced a couple of errors; especially after I had run the script a couple of times.
The first inadequacy showed up when the initial running of the playbook would not complete. I eventually cancelled it after about 26 hours. Upon investigation, I found that its the line `sudo mysql_secure_installation` that's expecting a response and I did not make provisions for that. The initial solution to this was avoidance: commenting out the line and later on, I sought for how to rectify it and found the `expect` functionality which seemed to have profered a solution to the problem at hand.

**EVIDENCE OF SUCCESSFUL PLAYBOOK RUN**  
![ansible running in master](https://github.com/Aaretha/Cloud_Semester2_Examination_Project/assets/149208787/63122d65-8417-4a7a-bc77-af384dfc1261)  

**EVIDENCE OF ASSESSING THE APP ON THE VM FROM THE WEB BROWSER**  
![Evidence of accessing the app from web browser using ip address](https://github.com/Aaretha/Cloud_Semester2_Examination_Project/assets/149208787/db4ff226-5c42-42c9-8315-1c5589722d98)  
