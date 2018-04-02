/*
* Name        : CaseTriggerHandler
* Description : CaseTriggerHandler is a Trigger handler class for CaseTriggers
                Functions : 
                1.  Update number of associated Cases count on Journey detail
                2.  Populate Entitlements on Case
* Author      : Himanshu Maheshwari
* Create On   : 07 June 2016
*  |-------------------------------------------------------------------------|
*  | Version | Modified By      | Date       | Comment                       |
*  |-------------------------------------------------------------------------|
*  | 0.1     | Himanshu         | 07/06/2016 | Initial Version of Class      |
*  |-------------------------------------------------------------------------|
*/
public class CaseTriggerHandler {
    public Set<Id> jDetailIdSet = new Set<Id>();
    public List<Case> caseAddList = new List<Case>();

    public CaseTriggerHandler(Boolean isExecuting, Integer size) {

    }

    public void OnBeforeInsert(List<Case> newCaseList) {
        Set<Id> caseOwnerIdSet = new Set<Id>();
        for (Case cs : newCaseList) {
            if (!String.isBlank(cs.Department__c)) {
                caseOwnerIdSet.add(cs.OwnerId);
            }
        }

        Map<Id, User> userMap;
        if (caseOwnerIdSet.size() > 0) {
            userMap = new Map<Id, User>([SELECT Id, Profile.Name FROM User WHERE Id IN: caseOwnerIdSet]);
        }

        for (Case cs : newCaseList) {
            if (!String.isBlank(cs.Department__c)) {
                if (userMap.containsKey(cs.OwnerId) && (userMap.get(cs.OwnerId).Profile.Name == 'Customer Experience' || userMap.get(cs.OwnerId).Profile.Name == 'Customer Experience - Team Leads')) {
                    caseAddList.add(cs);
                }
            }
        }

        if (caseAddList.size() > 0)
            EntitlementAssignment(caseAddList);
    }

    public void onAfterInsert(List<Case> newCaseList) {
        for (Case cs : newCaseList) {
            if (cs.Flight_Record__c != NULL) {
                jDetailIdSet.add(cs.Flight_Record__c);
            }
        }

        if (jDetailIdSet.size() > 0)
            UpdateJourneyDetail(jDetailIdSet);
    }

    
    public void OnBeforeUpdate(List<Case> newCaselist, Map<Id, case> oldCaseMap) {
        Set<Id> caseOwnerIdSet = new Set<Id>();
        List<Id> csIdList = new List<Id>();
        for (Case csNew : newCaseList) {
            System.debug('Owner ID ------------- ' + csNew.OwnerId);
            if (csNew.OwnerId != oldCaseMap.get(csNew.Id).OwnerId || csNew.Department__c != oldCaseMap.get(csNew.Id).Department__c || csNew.Category__c != oldCaseMap.get(csNew.Id).Category__c || csNew.Sub_Department__c != oldCaseMap.get(csNew.Id).Sub_Department__c || csNew.Sub_Category__c != oldCaseMap.get(csNew.Id).Sub_Category__c ) {
                caseOwnerIdSet.add(csNew.OwnerId);
            }
        }

        Map<Id, User> userMap;
        if (caseOwnerIdSet.size() > 0) {
            userMap = new Map<Id, User>([SELECT Id, Profile.Name FROM User WHERE Id IN: caseOwnerIdSet]);
        }

        for (Case cs : newCaseList) {
            if (cs.OwnerId != oldCaseMap.get(cs.Id).OwnerId || cs.Department__c != oldCaseMap.get(cs.Id).Department__c || cs.Category__c != oldCaseMap.get(cs.Id).Category__c || cs.Sub_Department__c != oldCaseMap.get(cs.Id).Sub_Department__c || cs.Sub_Category__c != oldCaseMap.get(cs.Id).Sub_Category__c ) {
                if (userMap.containsKey(cs.OwnerId)) {
                    if (userMap.get(cs.OwnerId).Profile.Name != 'Customer Experience' || userMap.get(cs.OwnerId).Profile.Name == 'Customer Experience - Team Leads') {
                        cs.EntitlementId = NULL;
                        csIdList.add(cs.Id);
                    } else {
                        caseAddList.add(cs);
                    }
                } else {
                    if (String.valueOf(cs.OwnerId).startsWith('00G')) {
                        cs.EntitlementId = NULL;
                        csIdList.add(cs.Id);
                    }
                }
            }
        }

        if (caseAddList.size() > 0)
            EntitlementAssignment(caseAddList);

        if (csIdList.size() > 0)
            CaseTriggerHandler.UpdateCases(csIdList);
    }

    public void onAfterUpdate(List<Case> newCaseList, Map<Id, Case> oldCaseMap) {
        for (Case cs : newCaseList) {
            if (cs.Flight_Record__c != oldCaseMap.get(cs.Id).Flight_Record__c) {
                jDetailIdSet.add(cs.Flight_Record__c);
                if (oldCaseMap.get(cs.Id).Flight_Record__c != NULL) {
                    jDetailIdSet.add(oldCaseMap.get(cs.Id).Flight_Record__c);
                }
            }
        }

        if (jDetailIdSet.size() > 0)
            UpdateJourneyDetail(jDetailIdSet);

        /*List<Case> caseUpdateList=new List<Case>();
        for(Case cs:newCaseList){
            Case tempcase=new Case();
            tempcase.Id=cs.Id;
            system.debug('tempcase'+tempcase);
            system.debug('tempcase owner'+tempcase.Case_Owner_Profile__c);
            if(tempcase.Case_Owner_Profile__c=='Customer Experience'){
                //oldCaseMap.get(tempcase.Id).Case_Owner_Profile__c!= tempcase.Case_Owner_Profile__c &&
                tempcase.Entitlement_Start_Date__c=System.now();
                system.debug('tempcase.Entitlement_Start_Date__c'+tempcase.Entitlement_Start_Date__c);
                caseUpdateList.add(tempcase);
            }
        }
        if(caseUpdateList.size()>0)
            update caseUpdateList;*/
    }

    //Updating Count of cases on the booking records
    public void UpdateJourneyDetail(Set<Id> jDetailIdSet) {
        List<Journey_Detail__c> jDetailList = new List<Journey_Detail__c>();
        for (Journey_Detail__c jDetail : [SELECT Id, Total_number_of_cases__c, (SELECT Id FROM Cases__r) FROM Journey_Detail__c WHERE Id IN: jDetailIdSet]) {
            jDetail.Total_number_of_cases__c = jDetail.Cases__r.size();
            jDetailList.add(jDetail);
        }

        if (jDetailList.size() > 0)
            update jDetailList;
    }

    //Tag Entitlement Record with case based on Department,Sub department,Category and subcategory to set miletstones
    public void EntitlementAssignment(List<Case> caseList) {
        Map<String, Entitlement> entitlementMap = new Map<String, Entitlement>();

        for (Entitlement ent : [SELECT Id, Name,External_Id__c FROM Entitlement]) {
            entitlementMap.put(ent.External_Id__c, ent);
        }

        System.debug('Update Entitlement :::::::::::::::');

        List<Id> updateCaseIdList = new List<Id>();
        for (Case c : caseList) {
            String entitlementkey;

            if (!string.isBlank(c.Department__c)) {
                entitlementkey = c.Department__c;
            }

            if (!string.isBlank(c.Sub_Department__c)) {
                if (string.isBlank(entitlementkey)) {
                    entitlementkey = c.Sub_Department__c;
                } else {
                    entitlementkey += '-' + c.Sub_Department__c;
                }
            }
            if (!string.isBlank(c.Category__c)) {
                if (string.isBlank(entitlementkey)) {
                    entitlementkey = c.Category__c;
                } else {
                    entitlementkey += '-' + c.Category__c;
                }
            }
            if (!string.isBlank(c.Sub_Category__c)) {
                if (string.isBlank(entitlementkey)) {
                    entitlementkey = c.Sub_Category__c;
                } else {
                    entitlementkey += '-' + c.Sub_Category__c;
                }
            }

            system.debug('Entitlement Key ------' + entitlementkey);

            if (entitlementMap.containsKey(entitlementkey)) {
                System.debug('In ::::::::::::::: 7');
                c.EntitlementId = entitlementMap.get(entitlementkey).Id;
                updateCaseIdList.add(c.Id);
            } else {
                System.debug('In ::::::::::::::: 8');
                c.EntitlementId = null;
            }
        }

        if (updateCaseIdList.size() > 0)
            CaseTriggerHandler.UpdateCases(updateCaseIdList);
    }

    @future
    public static void UpdateCases(List<Id> caseIdList) {
        if (caseIdList.size() > 0) {
            update [SELECT Id FROM Case WHERE Id In: caseIdList];
        }
    }
}