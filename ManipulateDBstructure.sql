-- Adam Huggins
--Question 1
ALTER TABLE ProductList ADD Description VARCHAR2(250); 
ALTER TABLE ProductList ADD Price NUMBER(6,2);

UPDATE ProductList p 

SET (p.Price, p.Description) = 

    (SELECT s.Price, s.Description 

     FROM Storefront s 

     WHERE s.ProductCode = 'GAME1') 

WHERE p.ProductCode = 'GAME1'; 

--Question 2
CREATE TABLE chatlog (
    chatid     NUMBER(3),
    receiverid NUMBER(3),
    senderid   NUMBER(3),
    datesent   DATE,
    content    VARCHAR2(250),

    CONSTRAINT chatlog_pk PRIMARY KEY (chatid),

    CONSTRAINT chatlog_receiver_fk
        FOREIGN KEY (receiverid)
        REFERENCES userbase(userid),

    CONSTRAINT chatlog_sender_fk
        FOREIGN KEY (senderid)
        REFERENCES userbase(userid)
);

INSERT INTO CHATLOG VALUES (1, 102, 101, DATE '2025-01-10', 'Hey, did you check out the new RPG sale?'); 
INSERT INTO CHATLOG VALUES (2, 101, 102, DATE '2025-01-10', 'Yeah! Picked up two games already.'); 
INSERT INTO CHATLOG VALUES (3, 103, 101, DATE '2025-01-11', 'Anyone want to squad up later?'); 
INSERT INTO CHATLOG VALUES (4, 101, 103, DATE '2025-01-11', 'I am down after 8pm.'); 
INSERT INTO CHATLOG VALUES (5, 104, 102, DATE '2025-01-12', 'Did you leave a review on VaporGames?'); 
INSERT INTO CHATLOG VALUES (6, 102, 104, DATE '2025-01-12', 'Not yet, but I will tonight.'); 
INSERT INTO CHATLOG VALUES (7, 105, 103, DATE '2025-01-13', 'This indie game is way better than expected.'); 
INSERT INTO CHATLOG VALUES (8, 103, 105, DATE '2025-01-13', 'Agreed, the soundtrack is amazing.'); 
INSERT INTO CHATLOG VALUES (9, 104, 101, DATE '2025-01-14', 'Your wishlist recommendations were spot on.'); 
INSERT INTO CHATLOG VALUES (10, 101, 104, DATE '2025-01-14', 'Glad it helped!'); 
INSERT INTO CHATLOG VALUES (11, 105, 102, DATE '2025-01-15', 'Are you joining the tournament this weekend?'); 
INSERT INTO CHATLOG VALUES (12, 102, 105, DATE '2025-01-15', 'Yeah, already signed up.');

--Question 3
CREATE TABLE friendslist (
    userid   NUMBER(3),
    friendid NUMBER(3),

    CONSTRAINT friendslist_pk
        PRIMARY KEY (userid, friendid),

    CONSTRAINT friendslist_user_fk
        FOREIGN KEY (userid)
        REFERENCES userbase(userid),

    CONSTRAINT friendslist_friend_fk
        FOREIGN KEY (friendid)
        REFERENCES userbase(userid)
);

INSERT INTO friendslist VALUES (101,102);
INSERT INTO friendslist VALUES (101,103);
INSERT INTO friendslist VALUES (101,104);
INSERT INTO friendslist VALUES (102,101);
INSERT INTO friendslist VALUES (102,105);
INSERT INTO friendslist VALUES (103,101);
INSERT INTO friendslist VALUES (103,104);
INSERT INTO friendslist VALUES (104,101);
INSERT INTO friendslist VALUES (104,103);
INSERT INTO friendslist VALUES (105,102);
INSERT INTO friendslist VALUES (105,103);
INSERT INTO friendslist VALUES (105,104);

--Question 4
CREATE TABLE wishlist (
    userid       NUMBER(3),
    productcode  VARCHAR2(5),
    position     NUMBER(3),

    CONSTRAINT wishlist_pk
        PRIMARY KEY (userid, productcode),

    CONSTRAINT wishlist_user_fk
        FOREIGN KEY (userid)
        REFERENCES userbase(userid),

    CONSTRAINT wishlist_product_fk
        FOREIGN KEY (productcode)
        REFERENCES productlist(productcode)
);
INSERT INTO WISHLIST VALUES (101, 'GAME1', 1); 
INSERT INTO WISHLIST VALUES (101, 'GAME3', 2); 
INSERT INTO WISHLIST VALUES (101, 'GAME5', 3); 
INSERT INTO WISHLIST VALUES (102, 'GAME2', 1); 
INSERT INTO WISHLIST VALUES (102, 'GAME4', 2); 
INSERT INTO WISHLIST VALUES (103, 'GAME1', 1); 
INSERT INTO WISHLIST VALUES (103, 'GAME6', 2); 
INSERT INTO WISHLIST VALUES (103, 'GAME7', 3); 
INSERT INTO WISHLIST VALUES (104, 'GAME3', 1); 
INSERT INTO WISHLIST VALUES (104, 'GAME5', 2); 
INSERT INTO WISHLIST VALUES (105, 'GAME2', 1); 
INSERT INTO WISHLIST VALUES (105, 'GAME4', 2); 
INSERT INTO WISHLIST VALUES (105, 'GAME8', 3);
); 

--Question 5
CREATE TABLE userprofile (

    userid      NUMBER(3),
    imagefile   VARCHAR2(250),
    description VARCHAR2(250),

    CONSTRAINT userprofile_pk
        PRIMARY KEY (userid),

    CONSTRAINT userprofile_user_fk
        FOREIGN KEY (userid)
        REFERENCES userbase(userid)
);

INSERT INTO userprofile VALUES (101,'avatar101.png','Competitive FPS player and streamer.');
INSERT INTO userprofile VALUES (102,'avatar102.png','Casual gamer who loves RPGs.');
INSERT INTO userprofile VALUES (103,'avatar103.png','Strategy games and speedruns.');
INSERT INTO userprofile VALUES (104,'avatar104.png','Team player, healer main.');
INSERT INTO userprofile VALUES (105,'avatar105.png','Late night ranked grinder.');
INSERT INTO userprofile VALUES (106,'avatar106.png','Indie games enthusiast.');
INSERT INTO userprofile VALUES (107,'avatar107.png','Achievement hunter.');
INSERT INTO userprofile VALUES (108,'avatar108.png','MMO raider and crafter.');
INSERT INTO userprofile VALUES (109,'avatar109.png','Retro games collector.');
INSERT INTO userprofile VALUES (110,'avatar110.png','New player exploring everything.');

--Question 6
CREATE TABLE securityquestion (
    questionid NUMBER,
    userid     NUMBER(3),
    question   VARCHAR2(250),
    answer     VARCHAR2(250),

    CONSTRAINT securityquestion_pk
        PRIMARY KEY (questionid),

    CONSTRAINT securityquestion_user_fk
        FOREIGN KEY (userid)
        REFERENCES userbase(userid)
);

INSERT INTO securityquestion VALUES (1,101,'What was your first pet’s name?','Max');
INSERT INTO securityquestion VALUES (2,102,'What city were you born in?','Norfolk');
INSERT INTO securityquestion VALUES (3,103,'What is your favorite game?','Halo');
INSERT INTO securityquestion VALUES (4,104,'What is your mother’s maiden name?','Smith');
INSERT INTO securityquestion VALUES (5,105,'What was the name of your elementary school?','Bayview');
INSERT INTO securityquestion VALUES (6,106,'What is your favorite food?','Pizza');

INSERT INTO securityquestion VALUES (7,101,'What is your favorite color?','Blue');
INSERT INTO securityquestion VALUES (8,102,'What is your dream job?','Game designer');
INSERT INTO securityquestion VALUES (9,103,'What is your favorite movie?','Inception');
INSERT INTO securityquestion VALUES (10,104,'What was your first car?','Civic');
INSERT INTO securityquestion VALUES (11,105,'What is your favorite sport?','Basketball');
INSERT INTO securityquestion VALUES (12,106,'What is your childhood nickname?','Ace');

--Question 7
CREATE TABLE communityrules (
    rulenum       NUMBER(3),
    title         VARCHAR2(250),
    description   VARCHAR2(250),
    severitypoint NUMBER(4),

    CONSTRAINT communityrules_pk
        PRIMARY KEY (rulenum)
);

INSERT INTO communityrules VALUES (1,'No Harassment','Harassment or bullying of any kind is prohibited.',100);
INSERT INTO communityrules VALUES (2,'No Hate Speech','Hate speech will not be tolerated.',150);
INSERT INTO communityrules VALUES (3,'No Cheating','Using exploits or cheats is forbidden.',120);
INSERT INTO communityrules VALUES (4,'Respect Others','Treat all players with respect.',50);
INSERT INTO communityrules VALUES (5,'No Spamming','Spamming chat or messages is not allowed.',40);
INSERT INTO communityrules VALUES (6,'No Impersonation','Do not impersonate staff or players.',80);
INSERT INTO communityrules VALUES (7,'Appropriate Language','Keep language appropriate.',30);
INSERT INTO communityrules VALUES (8,'No Scamming','Scamming other users is prohibited.',130);
INSERT INTO communityrules VALUES (9,'No Threats','Threats of violence are not allowed.',200);
INSERT INTO communityrules VALUES (10,'No Advertising','Unapproved advertising is prohibited.',60);
INSERT INTO communityrules VALUES (11,'No Account Sharing','Sharing accounts is not allowed.',70);
INSERT INTO communityrules VALUES (12,'Follow Game Rules','Always follow in-game rules.',20);

--Question 8
CREATE TABLE INFRACTIONS ( 
    INFRACTIONID NUMBER, 
    USERID       NUMBER(3), 
    RULENUM      NUMBER(3), 
    DATEASSIGNED DATE, 
    PENALTY      VARCHAR2(250), 
    CONSTRAINT PK_INFRACTIONS PRIMARY KEY (INFRACTIONID), 
    CONSTRAINT FK_INFRACTIONS_USER FOREIGN KEY (USERID) 
        REFERENCES USERBASE (USERID), 
    CONSTRAINT FK_INFRACTIONS_RULE FOREIGN KEY (RULENUM) 
        REFERENCES COMMUNITYRULES (RULENUM) 
); 

INSERT INTO INFRACTIONS VALUES (1, 101, 1, DATE '2025-01-05', 'Warning issued'); 
INSERT INTO INFRACTIONS VALUES (2, 102, 3, DATE '2025-01-06', '24-hour chat mute'); 
INSERT INTO INFRACTIONS VALUES (3, 103, 5, DATE '2025-01-07', 'Temporary suspension'); 
INSERT INTO INFRACTIONS VALUES (4, 104, 2, DATE '2025-01-08', 'Content removed'); 
INSERT INTO INFRACTIONS VALUES (5, 105, 4, DATE '2025-01-09', 'Warning issued'); 
INSERT INTO INFRACTIONS VALUES (6, 106, 6, DATE '2025-01-10', '3-day account suspension'); 
INSERT INTO INFRACTIONS VALUES (7, 107, 7, DATE '2025-01-11', 'Permanent ban'); 
INSERT INTO INFRACTIONS VALUES (8, 108, 1, DATE '2025-01-12', 'Warning issued'); 
INSERT INTO INFRACTIONS VALUES (9, 109, 8, DATE '2025-01-13', 'Loss of posting privileges'); 
INSERT INTO INFRACTIONS VALUES (10, 110, 9, DATE '2025-01-14', 'Account flagged for review'); 
INSERT INTO INFRACTIONS VALUES (11, 101, 10, DATE '2025-01-15', '7-day suspension'); 
INSERT INTO INFRACTIONS VALUES (12, 102, 2, DATE '2025-01-16', 'Post deletion and warning'); 

--Question 9
CREATE TABLE USERSUPPORT ( 
    TICKETID      NUMBER, 
    EMAIL         VARCHAR2(250), 
    ISSUE         VARCHAR2(250), 
    DATESUBMITTED DATE, 
    DATEUPDATED   DATE, 
    STATUS        VARCHAR2(250), 
    CONSTRAINT PK_USERSUPPORT PRIMARY KEY (TICKETID) 
);  

INSERT INTO USERSUPPORT VALUES (1, 'user101@email.com', 'Cannot log into my account', DATE '2025-01-05', DATE '2025-01-05', 'NEW'); 
INSERT INTO USERSUPPORT VALUES (2, 'user102@email.com', 'Game download stuck at 99%', DATE '2025-01-06', DATE '2025-01-07', 'IN PROGRESS'); 
INSERT INTO USERSUPPORT VALUES (3, 'user103@email.com', 'Incorrect charge on my account', DATE '2025-01-07', DATE '2025-01-08', 'CLOSED'); 
INSERT INTO USERSUPPORT VALUES (4, 'user104@email.com', 'Unable to reset password', DATE '2025-01-08', DATE '2025-01-08', 'NEW'); 
INSERT INTO USERSUPPORT VALUES (5, 'user105@email.com', 'Game crashes on startup', DATE '2025-01-09', DATE '2025-01-10', 'IN PROGRESS'); 
INSERT INTO USERSUPPORT VALUES (6, 'user106@email.com', 'Account suspended by mistake', DATE '2025-01-10', DATE '2025-01-12', 'CLOSED'); 
INSERT INTO USERSUPPORT VALUES (7, 'user107@email.com', 'Unable to add friend', DATE '2025-01-11', DATE '2025-01-11', 'NEW'); 
INSERT INTO USERSUPPORT VALUES (8, 'user108@email.com', 'Wishlist items disappeared', DATE '2025-01-12', DATE '2025-01-13', 'IN PROGRESS'); 
INSERT INTO USERSUPPORT VALUES (9, 'user109@email.com', 'Chat messages not sending', DATE '2025-01-13', DATE '2025-01-14', 'CLOSED'); 
INSERT INTO USERSUPPORT VALUES (10, 'user110@email.com', 'Refund request for recent purchase', DATE '2025-01-14', DATE '2025-01-15', 'IN PROGRESS'); 
INSERT INTO USERSUPPORT VALUES (11, 'guest@email.com', 'General question about platform', DATE '2025-01-15', DATE '2025-01-15', 'NEW'); 
INSERT INTO USERSUPPORT VALUES (12, 'helpme@email.com', 'Email verification not received', DATE '2025-01-16', DATE '2025-01-17', 'CLOSED'); 

--Question 10

CREATE VIEW VW_UNIQUE_SECURITY_QUESTIONS AS 
SELECT DISTINCT QUESTION 
FROM SECURITYQUESTION; 

CREATE VIEW VW_ACTIVE_SUPPORT_TICKETS AS 
SELECT 
    TICKETID, 
    EMAIL, 
    ISSUE, 
    DATEUPDATED 
FROM USERSUPPORT 
WHERE STATUS IN ('NEW', 'IN PROGRESS') 
ORDER BY DATEUPDATED ASC; 


SELECT * FROM VW_UNIQUE_SECURITY_QUESTIONS; 

SELECT * FROM VW_ACTIVE_SUPPORT_TICKETS; 
