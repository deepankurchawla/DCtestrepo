@isTest
public class AccountTriggerTest {
    public static testMethod void TestAccountTrigger() {

        TriggerController__c tController = new TriggerController__c();
        tController.Name = 'AccountTrigger';
        tcontroller.IsActive__c = true;
        insert tController;

        Account acc = new Account();
        acc.FirstName = 'test';
        acc.LastName = 'Last';
        acc.PersonHomePhone = '98745102';
        acc.Home_Phone_Type__pc = 'Mobile';
        acc.Contact__pc = '9874102563';
        insert acc;

        
        //insert new Label(Name='Spicejet_Account_Id', Value=acc.Id);

        delete acc;
    }
}