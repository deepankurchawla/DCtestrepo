/*
* Name        : LeadTriggerHandler
* Description : LeadTriggerHandler is a Trigger handler class for LeadTriggers
                Functions : 
                1.  To covert Lead
                2.  To mandate Central Coordinators to update Navitaire Id before approving the Lead
* Author      : Himanshu Maheshwari
* Create On   : 03 September 2016
*  |-------------------------------------------------------------------------|
*  | Version | Modified By      | Date       | Comment                       |
*  |-------------------------------------------------------------------------|
*  | 0.1     | Himanshu         | 03/09/2016 | Initial Version of Class      |
*  |-------------------------------------------------------------------------|
*/
public class LeadTriggerHandler {
    public LeadTriggerHandler(Boolean isExecuting, Integer size) {

    }

    public void OnBeforeUpdate(List<Lead> newLeadlist, Map<Id, Lead> oldLeadMap) {
        for (Lead ld : newLeadlist) {
            if (String.isBlank(ld.Navitaire_Id__c) && ld.Approval_Status__c == 'Approved by Central Coordinator' && ld.Approval_Status__c != oldLeadMap.get(ld.Id).Approval_Status__c){
                ld.addError(System.Label.Enter_Navitaire_Id_Error_Message);
            }
        }
    }

    public void OnAfterUpdate(List<Lead> newLeadlist, Map<Id, Lead> oldLeadMap) {
        List<Lead> LeadList = new List<Lead>();
        for (Lead ld : newLeadlist) {
            //if(ld.Approval_Status__c == 'Approved' && ld.Navitaire_Id__c != NULL && oldLeadMap.get(ld.Id).Navitaire_Id__c == NULL) {
            if(ld.Approval_Status__c == 'Approved' && ld.Created_in_Navitaire__c == TRUE && oldLeadMap.get(ld.Id).Created_in_Navitaire__c == FALSE) {
                leadList.add(ld);
            }            
        }

        if(leadList.size() > 0)
                ConvertLead(leadList);
    }

    public void ConvertLead(List<Lead> leadList){
        LeadStatus convertStatus = [SELECT MasterLabel FROM LeadStatus where IsConverted = TRUE limit 1];
        List<Contact> cnctList = new List<Contact>();
        List<Account> accList = new List<Account>();
        List<Product__c> prdList = new List<Product__c>();

        for(Lead ld : leadList){
            Database.LeadConvert lc = new Database.LeadConvert();
            lc.setDoNotCreateOpportunity(TRUE);
            lc.setConvertedStatus(convertStatus.MasterLabel);
            lc.setLeadId(ld.Id);
            
            Database.LeadConvertResult lcr = Database.convertLead(lc);
            System.assert(lcr.isSuccess());

            Account acc = new Account(Id = lcr.getAccountId());
            acc.Contact_First_Name__c = ld.First_Name_AS__c;
            acc.Contact_Last_Name__c = ld.Last_Name_AS__c;
            accList.add(acc);

            //if(Schema.Sobjecttype.Lead.getRecordTypeInfosByName().get('Corporate').getRecordTypeId() == ld.RecordTypeId){
            Contact cnct = new Contact();
            cnct.AccountId = lcr.getAccountId();
            cnct.FirstName = ld.First_Name_AS__c;
            cnct.LastName = ld.Last_Name_AS__c;
            cnct.Title = ld.Title_AS__c;
            cnct.MobilePhone = ld.Phone_AS__c;
            cnct.Email = ld.Email_AS__c;
            cnctList.add(cnct);
            //}

            Product__c pr = new Product__c();
            pr.Account__c = lcr.getAccountId();
            pr.Navitaire_ID__c = ld.Navitaire_Id__c;
            pr.Product_Role__c = ld.Product_Role__c;
            pr.Status__c = ld.Approval_Status__c;
            pr.Created_in_Navitaire__c = ld.Created_in_Navitaire__c;
            pr.OwnerId = ld.OwnerId;
            prdList.add(pr);
        }

        if(accList.size() > 0)
            update accList;

        if(cnctList.size() > 0)
            insert cnctList;

        if(prdList.size() > 0)
            insert prdList;
    }
}