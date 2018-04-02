@isTest
public class LeadTriggerTest {
    public static testMethod void TestLeadTrigger() {

        TriggerController__c tController = new TriggerController__c();
        tController.Name = 'LeadTrigger';
        tcontroller.IsActive__c = true;
        insert tController;

        TriggerController__c tController1 = new TriggerController__c();
        tController1.Name = 'AccountTrigger';
        tcontroller1.IsActive__c = true;
        insert tController1;

        Id corporateRecordTypeId = Schema.SObjectType.Lead.getRecordTypeInfosByName().get('Corporate').getRecordTypeId();

        Lead ld = new Lead();
        ld.LastName = 'Test';
        ld.Status = 'Open';
        ld.Company = 'ABC Industries';
        ld.Product_Role__c = 'TATA';
        ld.RecordTypeId = corporateRecordTypeId;
        ld.Last_Name_AS__c = 'Rakesh';
        ld.Approval_Status__c = 'Draft';
        insert ld;

        ld.Approval_Status__c = 'Approval by Central Coordinator';
        try{
            update ld;
        }catch(Exception ex){}

        ld.Approval_Status__c = 'Approved';
        ld.Created_in_Navitaire__c = TRUE;
        update ld;
    }
}