/*
* Name        : AccountTriggerHandler
* Description : AccountTriggerHandler is a Trigger handler class for AccountTriggers
                Functions : 
                1.  To prevent "SPICEJET" acount from deletion
* Author      : Himanshu Maheshwari
* Create On   : 26 August 2016
*  |-------------------------------------------------------------------------|
*  | Version | Modified By      | Date       | Comment                       |
*  |-------------------------------------------------------------------------|
*  | 0.1     | Himanshu         | 07/06/2016 | Initial Version of Class      |
*  |-------------------------------------------------------------------------|
*/
public class AccountTriggerHandler {
    public AccountTriggerHandler(Boolean isExecuting, Integer size) {

    }

    public void OnBeforeDelete(List<Account> newAccountlist, Map<Id, Account> oldAccountMap) {
        for (Account acc : newAccountlist) {
            if (acc.Id == System.Label.Spicejet_Account_Id){
                acc.addError(System.Label.Account_Deletion_Error_Message);
            }
        }
    }
}