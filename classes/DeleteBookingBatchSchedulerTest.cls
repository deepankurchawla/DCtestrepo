/* ****************************************************************************************************************
 Name          : DeleteBookingBatchSchedulerTest
 Description   : DeleteBookingBatchSchedulerTest Apex Class is the Test Class for DeleteBookingBatchScheduler.
                 
 Author        : Himanshu Maheshwari (Compro Technologies)
 Creation Date : 20-July-2016
**************************************************************************************************************** */
@isTest
public class DeleteBookingBatchSchedulerTest {
    public static testMethod void TestDeleteBookingBatchScheduler() {

        TriggerController__c tController = new TriggerController__c();
        tController.Name = 'CaseTrigger';
        tcontroller.IsActive__c = true;
        insert tController;

        TriggerController__c tController1 = new TriggerController__c();
        tController1.Name = 'AccountTrigger';
        tcontroller1.IsActive__c = true;
        insert tController1;

        Emails_for_Email_Notification__c emailVar = new Emails_for_Email_Notification__c();
        emailVar.Name = 'Booking Deletion Batch';
        emailVar.To_Email_Addresses__c = 'test@testing.com,test1@testing.com';
        insert emailVar;

        Maximum_Record_Retention__c mrr = new Maximum_Record_Retention__c();
        mrr.Name = 'Retention Period';
        mrr.Bookings__c = 3;
        insert mrr;

        Account acc = new Account();
        acc.FirstName = 'test';
        acc.LastName = 'Last';
        acc.PersonHomePhone = '98745102';
        acc.Home_Phone_Type__pc = 'Mobile';
        acc.Contact__pc = '9874102563';
        insert acc;
        
        Booking__c b = new Booking__c();
        b.Name = '1212012';
        b.Booked_By__c = acc.Id;
        b.Booking_Date__c = datetime.now();
        b.Booking_Id__c = '74512086';
        b.Booking_Status__c = 'Active';
        insert b;

        Journey_Detail__c j = new Journey_Detail__c();
        j.Name = 'SJ-321';
        j.Arrival_Station__c = 'BOM';
        j.Arrival_Time__c = datetime.now();
        j.Booking__c = b.Id;
        j.Departure_Station__c = 'DEL';
        j.Departure_Time__c = datetime.now();
        j.Journey_Number__c = '1';
        j.Leg_Number__c = '2';
        insert j;

        Profile p = [SELECT Id FROM Profile WHERE Name = 'Customer Experience'];
        User u = new User(Alias = 'standt', Email = 'testuser@spicejettestorg.com',
                          EmailEncodingKey = 'UTF-8', LastName = 'Testing', LanguageLocaleKey = 'en_US',
                          LocaleSidKey = 'en_US', ProfileId = p.Id,
                          TimeZoneSidKey = 'America/Los_Angeles', UserName = 'testuser@spicejettestorg.com');

        System.runAs(u) {
            // The following code runs as user 'u'
            System.debug('Current User: ' + UserInfo.getUserName());
            System.debug('Current Profile: ' + UserInfo.getProfileId());

            Case testCase = new Case(Department__c = 'Catering',
                                     Category__c = 'Catering - Meal Quality',
                                     Status = 'New',
                                     Origin = 'Phone',
                                     Type = 'Complaint'
                                    );
            insert testcase;

            Case testCase2 = new Case(Department__c = 'Catering',
                                      Category__c = 'Catering - Meal Quality',
                                      //testcase.Sub_Category__c='';
                                      //testcase.Sub_Department__c='';
                                      Status = 'New',
                                      Origin = 'Phone',
                                      Type = 'Complaint'
                                      //Flight_Record__c = j.Id
                                     );
            insert testcase2;

            testcase.Department__c = 'Engineering/ MCC';
            testcase.Category__c = 'Aircraft Interior';
            //testcase.Flight_Record__c = j.Id;
            update testCase;
        }

        String CRON_EXP = '0 0 0 15 3 ? 2022';

        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('DeleteBookingBatchSchedulerTest', CRON_EXP, new DeleteBookingBatchScheduler());
        Test.stopTest();

        DeleteBookingBatch delBookingBatch = new DeleteBookingBatch();
        Database.executeBatch(delBookingBatch, 2000);
    }    
}