INSERT INTO Tag (Name) VALUES ('ADHD');
INSERT INTO Tag (Name) VALUES('Anxiety');
INSERT INTO Tag (Name) VALUES('Autism');
INSERT INTO Tag (Name) VALUES ('Bipolar Disorder');
INSERT INTO Tag (Name) VALUES('Coping Skills') ; 
INSERT INTO Tag (Name) VALUES('Depression');
INSERT INTO Tag (Name) VALUES('Disability');
INSERT INTO Tag (Name) VALUES ('Divorce');
INSERT INTO Tag (Name) VALUES ('Dyslexia');
INSERT INTO Tag (Name) VALUES('Eating Disorders');
INSERT INTO Tag (Name) VALUES('Grief and Loss');
INSERT INTO Tag (Name) VALUES ('LGBTQ+ Self-Care');
INSERT INTO Tag (Name) VALUES ('Mental Health Awareness Month');
INSERT INTO Tag (Name) VALUES ('Mental Illness') ; 
INSERT INTO Tag (Name) VALUES('Mindfulness'); 

INSERT INTO Interaction (Name) VALUES ('Like');
INSERT INTO Interaction (Name) VALUES ('Support');
INSERT INTO Interaction (Name) VALUES ('Love');

INSERT INTO Message (Uuid, Title, Body) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 'An excellent post', 'This is the best post I ever saw. So read it!');
INSERT INTO Message (Uuid, Title, Body) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 'This post is OK', 'Another fine post if I ever saw one. Check it out!');
INSERT INTO Message (Uuid, Title, Body) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 'Just a post', 'You may think there is something special about this post, but it is just a post.');

INSERT INTO MessageToTag(MessageUuid, TagId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 3);
INSERT INTO MessageToTag(MessageUuid, TagId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 11);
INSERT INTO MessageToTag(MessageUuid, TagId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 5);
INSERT INTO MessageToTag(MessageUuid, TagId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToTag(MessageUuid, TagId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 5);
INSERT INTO MessageToTag(MessageUuid, TagId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 7);
INSERT INTO MessageToTag(MessageUuid, TagId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 5);
INSERT INTO MessageToTag(MessageUuid, TagId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 9);
INSERT INTO MessageToTag(MessageUuid, TagId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 8);

INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 3);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 3);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 3);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('cec18c0e-fd0f-4e93-bb6b-a0183a6b2885', 3);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 3);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 3);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 3);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 3);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('b7f0433e-8564-443a-bda2-3e4df1bd910c', 3);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 1);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 2);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 3);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 3);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 3);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 3);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 3);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 3);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 3);
INSERT INTO MessageToInteraction(MessageUuid, InteractionId) VALUES ('576e4d20-00c7-4432-bb1d-597aba161014', 3);
