/*
 * Name        : CreateCustomerExt 
 * Description : CreateCustomerExt is a Extension class for CreateCustomer Visualforce. 
                 Purpose is to initiate Create Customer from Passenger Flow
 * Author      : Himanshu Maheshwari
 * Create On   : 21 June 2016
 *  |-------------------------------------------------------------------------|
 *  | Version | Modified By      | Date       | Comment                       |
 *  |-------------------------------------------------------------------------|
 *  | 0.1     | Himanshu         | 21/06/2016 | Initial Version of Class      |
 *  |-------------------------------------------------------------------------|
 */
@isTest
public class CreateCustomerExtTest {
    public static testMethod void  tagEntitlmenttoCase(){
        
        Account acc = new Account();
        acc.LastName = 'Test Name';
        insert acc;

        Booking__c b = new Booking__c();
        b.Booked_By__c = acc.Id;
        b.Booking_Id__c = '224512';
        //b.Booking_Date__c = System.today();
        insert b;

        Passenger__c pssngr = new Passenger__c();
        pssngr.Booking__c = b.Id;
        pssngr.Name = 'Test First Name';
        pssngr.Last_Name__c = 'Test Last Name';
        insert pssngr;
      
        ApexPages.StandardController sc = new ApexPages.StandardController(pssngr);
        CreateCustomerExt ccExt = new CreateCustomerExt(sc);
        ccExt.createCustFlow = new Flow.Interview.Create_Customer_from_Passenger(new Map<String, Object>());
        ccExt.CreateCustomer();
    }
}