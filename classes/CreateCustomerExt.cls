/*
 * Name        : CreateCustomerExt 
 * Description : CreateCustomerExt is a Extension class for CreateCustomer Visual force. 
                 Purpose is to initiate Create Customer from Passenger Flow
 * Author      : Himanshu Maheshwari
 * Create On   : 21 June 2016
 *  |-------------------------------------------------------------------------|
 *  | Version | Modified By      | Date       | Comment                       |
 *  |-------------------------------------------------------------------------|
 *  | 0.1     | Himanshu         | 21/06/2016 | Initial Version of Class      |
 *  |-------------------------------------------------------------------------|
 */
public class CreateCustomerExt {

    public Flow.Interview.Create_Customer_from_Passenger createCustFlow { get; set; }
    public Passenger__c pssngr;
    
    public CreateCustomerExt(ApexPages.StandardController controller) {
        pssngr = (Passenger__c)controller.getRecord();    
    }
    
    public PageReference CreateCustomer() {
        Map<String, Object> flowVarMap = new Map<String, Object>();
        flowVarMap.put('PassengerId', pssngr.Id);
        createCustFlow = new Flow.Interview.Create_Customer_from_Passenger(flowVarMap);
        createCustFlow.start();
                
        if(String.valueOf(createCustFlow.getVariableValue('AccountId')) != NULL){
            String accountId = String.valueOf(createCustFlow.getVariableValue('AccountId'));
            PageReference prRef = new PageReference('/'+ accountId + '/e?retURL=' + accountId);
            prRef.setRedirect(true);
            return prRef;
        }
        
        return null;
    }
}