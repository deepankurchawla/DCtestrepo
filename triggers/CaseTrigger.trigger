/**
 * Case
 * @description Case Trigger
 */

trigger CaseTrigger on Case (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    TriggerController__c tController = TriggerController__c.getValues('CaseTrigger');

    if (tController.IsActive__c) {
        CaseTriggerHandler handler = new CaseTriggerHandler(Trigger.isExecuting, Trigger.size);

        if (Trigger.isInsert && Trigger.isBefore) {
            handler.OnBeforeInsert(Trigger.new);
        }

        if (Trigger.isInsert && Trigger.isAfter) {
            handler.OnAfterInsert(Trigger.new);
        }

        if (Trigger.isUpdate && Trigger.isBefore) {
            handler.OnBeforeUpdate(Trigger.new, Trigger.oldMap);
        }

        if (Trigger.isUpdate && Trigger.isAfter) {
            handler.OnAfterUpdate(Trigger.new, Trigger.oldMap);
        }

        /*else if(Trigger.isDelete && Trigger.isBefore){
            handler.OnBeforeDelete(Trigger.old, Trigger.oldMap);
        }
        else if(Trigger.isDelete && Trigger.isAfter){
            handler.OnAfterDelete(Trigger.old, Trigger.oldMap);
        }

        else if(Trigger.isUnDelete){
            handler.OnUndelete(Trigger.new);
        }----------to be deployed later------------*/
    }
}