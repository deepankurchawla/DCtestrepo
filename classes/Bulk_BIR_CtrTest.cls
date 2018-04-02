/*
 * Name        : Bulk_BIR_CtrTest 
 * Description : Bulk_BIR_CtrTest is a test class for Extension class Bulk_BIR_Ctr. 
               : Himanshu Maheshwari
 * Create On   : 15 Sept 2016
 *  |-------------------------------------------------------------------------|
 *  | Version | Modified By      | Date       | Comment                       |
 *  |-------------------------------------------------------------------------|
 *  | 0.1     | Himanshu         | 15/09/2016 | Initial Version of Class      |
 *  |-------------------------------------------------------------------------|
 */
@isTest
public class Bulk_BIR_CtrTest {
    public static testMethod void  Bulk_BIR_CtrTest(){

        TriggerController__c tController = new TriggerController__c();
        tController.Name = 'AccountTrigger';
        tController.IsActive__c = TRUE;
        insert tController;

        TriggerController__c tController1 = new TriggerController__c();
        tController1.Name = 'CaseTrigger';
        tController1.IsActive__c = TRUE;
        insert tController1;
        
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
        j.Name = '516';
        j.Arrival_Station__c = 'BOM';
        j.Arrival_Time__c = datetime.now();
        j.Booking__c = b.Id;
        j.Departure_Station__c = 'DEL';
        j.Departure_Time__c = datetime.now();
        j.Journey_Number__c = '1';
        j.Leg_Number__c = '2';
        insert j;

        Passenger__c pssngr = new Passenger__c();
        pssngr.Booking__c = b.Id;
        pssngr.Name = 'Test First Name';
        pssngr.Last_Name__c = 'Test Last Name';
        insert pssngr;
      
        Bulk_BIR_Ctr bb = new Bulk_BIR_Ctr();
        bb.flight_Number = '516';
        bb.departure_Date = date.today();
        bb.arrival_Date = date.today();
        bb.ce.Arrival_Station__c = 'BOM';
        bb.ce.Departure_Station__c = 'DEL';
        bb.SearchFlightDetail();
        bb.custDetailsList[0].isBaggageLost = TRUE;
        bb.CreateBIRCases();
    }
}