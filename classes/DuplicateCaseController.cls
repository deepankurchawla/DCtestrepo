public with sharing class DuplicateCaseController {
    
    private ApexPages.StandardSetController standardController;
    public Case parentCase {get;set;}
    @TestVisible private case parentCaseRecord;
    private List<Case> duplicateCases = New List<Case>();
    
    public DuplicateCaseController(ApexPages.StandardSetController standardController)
    {
        parentCase = new Case();
        this.standardController = standardController;
    }
    
    public PageReference updateCases()
    {       
        // Get the selected records (optional, you can use getSelected to obtain ID's and do your own SOQL)
        
        
        if(parentCase.ParentId != null){
            
            parentCaseRecord = [select id, category__c, department__c,
                                sub_department__c, sub_category__c 
                                from case 
                                where id =: parentCase.ParentId];    
            
            
            List<Case> selectedCases = [select id, parentid, department__c, 
                                        category__c, sub_department__c, 
                                        sub_category__c 
                                        from case 
                                        where 
                                        id IN: standardController.getSelected()
                                       ];
            system.debug('standardController.getSelected()'+standardController.getSelected());
            if(standardController.getSelected()!=NULL){
                for(Case selectedCase : selectedCases)
                {
                  Case duplicateCase = New Case(Id = selectedCase.Id, ParentId = parentCaseRecord.Id,
                  Department__c = parentCaseRecord.Department__c,
                  Category__c = parentCaseRecord.Category__c,
                  Sub_Category__c = parentCaseRecord.Sub_Category__c,
                  Sub_Department__c = parentCaseRecord.Sub_Department__c,
                  Status = 'Duplicate - Closed');
                
                  duplicatecases.add(duplicateCase);
                    
                }
                 update duplicatecases;


            }else
                 {
                   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please select case records'));                 
                 }
            
        }
        
        PageReference docancel = standardController.cancel();
  
        return docancel;
    }
 
}