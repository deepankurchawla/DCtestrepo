@isTest
public class DuplicateCaseTest {
    
    public static testmethod void testDuplicateCaseclose(){
        Test.startTest();
        
        TriggerController__c tController = new TriggerController__c();
        tController.Name = 'CaseTrigger';
        tcontroller.IsActive__c = true;
        insert tController;
        
        Case PreTestParentCase=new Case(Subject='Baggage lost',
                                     Description='Baggage lost',
                                     Type='Query',
                                     Department__c='Reservations',
                                     Category__c='Rude Behavior',
                                     Status='Open',
                                     Origin='Email'
                                    );
        
         insert PreTestParentCase;
        Case TestParentCase=new Case(Subject='Baggage lost',
                                     Description='Baggage lost',
                                     Type='Query',
                                     ParentId=PreTestParentCase.Id,
                                     Department__c='Reservations',
                                     Category__c='Rude Behavior',
                                     Status='Open',
                                     Origin='Email'
                                    );
        
         insert TestParentCase;
        
        List<Case> caseList=new List<Case>();
        Test.setCurrentPage(Page.MassUpdateasDuplicate);
        
                
        Case TestCase1=new Case(Subject='Baggage lost',
                                     Description='Baggage lost',
                                     Type='Query',
                                     Status='Open',
                                     Origin='Email'
                                    );
         caseList.add(TestCase1);
         //insert TestCase1;
          
        
         Case TestCase2=new Case(Subject='Baggage lost',
                                     Description='Baggage lost',
                                     Type='Query',
                                     Status='Open',
                                     Origin='Email'
                                    );
          caseList.add(TestCase2);
          
          insert caseList; 
        
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(caseList);
        stdSetController.setSelected(caseList);  
        DuplicateCaseController  stdcontroller=new DuplicateCaseController(stdSetController);
        stdcontroller.parentCase =TestParentCase;
        stdcontroller.updateCases();
        
        Test.stopTest();              
    }
}