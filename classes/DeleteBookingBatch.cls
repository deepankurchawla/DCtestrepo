/*
 * Name        : DeleteBookingBatch
 * Description : DeleteBookingBatch is a batch apex class function is to automatically purge the 
                 Booking records after a certain peroid if no case is associated with it.
 * Author      : Himanshu Maheshwari
 * Create On   : 07 June 2016
 *  |-------------------------------------------------------------------------|
 *  | Version | Modified By      | Date       | Comment                       |
 *  |-------------------------------------------------------------------------|
 *  | 0.1     | Himanshu         | 07/06/2016 | Initial Version of Class      |
 *  |-------------------------------------------------------------------------|
 */
global class DeleteBookingBatch implements Database.Batchable<sObject>, Database.Stateful {
    global String query; 
    global Integer count = 0;
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        Maximum_Record_Retention__c maxRet = Maximum_Record_Retention__c.getInstance('Retention Period');
        Datetime dt = Datetime.newInstance(System.today().toStartOfMonth().addMonths(-(Integer)maxRet.Bookings__c), Time.newInstance(0, 0, 0, 0));

        query = 'SELECT Id, Total_Cases_Associated__c FROM Booking__c WHERE (Total_Cases_Associated__c = NULL OR Total_Cases_Associated__c = 0) AND (Last_Journey_Date__c <: dt OR Last_Journey_Date__c = NULL) AND Booking_Date__c <: dt';
        System.debug('Query ::::::::::' + query);
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Booking__c> scope) {
        count += scope.size();
        delete scope;
    }

    global void finish(Database.BatchableContext BC) {
        System.debug('Total Number of Booking records deleted ----- '+ count);
        AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email
                          FROM AsyncApexJob WHERE Id =: BC.getJobId()];

        Emails_for_Email_Notification__c delBookingEmailList = Emails_for_Email_Notification__c.getValues('Booking Deletion Batch');
        // Send an Email Notification.
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = delBookingEmailList.To_Email_Addresses__c.split(',');
        mail.setToAddresses(toAddresses);
        mail.setSubject('Booking Deletion Batch ' + a.Status);
        mail.setPlainTextBody('The Booking Deletion Batch processed. Total number of Booking records deleted - '+ count);
        
        if(!Test.isRunningTest()){
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }    
}