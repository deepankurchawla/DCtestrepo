public class Bulk_BIR_Ctr {
    public String flight_Number {get; set;}
    public Date arrival_Date {get; set;}
    public Date departure_Date {get; set;}
    public List <CustomerWrapper> custDetailsList {get; set;}
    public List <Account> accList {get; set;}
    public Boolean selectAll {get; set;}
    public Boolean birCreated {get; set;}
    public Boolean disableCreateBIR {get; set;}
    public List <Case> caseList {get; set;}
    public Case ce {get; set;}
       
    public Bulk_BIR_Ctr() {
        disableCreateBIR = FALSE;
        ce = new Case(Department__c = 'Airport Services');
        caseList = new List<Case>();
        custDetailsList = new List<CustomerWrapper>();
        accList = new List<Account>();
    }

    public void SearchFlightDetail(){
        Set <String> uniqueBookedBySet = new Set <String>();
        caseList = new List<Case>();
        custDetailsList = new List<CustomerWrapper>();
        
        for(Journey_Detail__c jDetail : [SELECT Id, PNR_No__c, Booking__r.Booked_By__r.PersonContactId, Booking__r.Booked_By__c, Booking__r.Booked_By__r.Name, Arrival_Station__c, Arrival_Time__c, Departure_Station__c, Departure_Time__c, Name FROM Journey_Detail__c WHERE Name =: flight_Number AND Arrival_Date__c =: arrival_Date AND Departure_Date__c =: departure_Date AND Arrival_Station__c =: ce.Arrival_Station__c AND Departure_Station__c =: ce.Departure_Station__c]){
            if(!uniqueBookedBySet.contains(jDetail.Booking__r.Booked_By__r.Name)){
                CustomerWrapper cWrap = new CustomerWrapper(jDetail);
                custDetailsList.add(cWrap);
                uniqueBookedBySet.add(jDetail.Booking__r.Booked_By__r.Name);
            }
        }
    }
    
    public void CreateBIRCases(){
        for(CustomerWrapper cWrap : custDetailsList){
            if(cWrap.isBaggageLost){
                Case cs = new Case();
                cs.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('BIR').getRecordTypeId();
                cs.ContactId = cWrap.jDetail.Booking__r.Booked_By__r.PersonContactId ;
                cs.Flight_Record__c = cWrap.jDetail.Id;
                cs.Created_by_Bulk_BIR__c = TRUE;
                cs.Type = 'Complaint';
                cs.Origin = 'Airport';
                cs.Department__c = ce.Department__c;
                cs.Category__c = ce.Category__c;
                caseList.add(cs);
            }
        }

        if(caseList.size() > 0)
            insert caseList;
            
        caseList = [SELECT Id, CaseNumber, PNR_No__c, ContactId, Contact.Name FROM Case WHERE Id IN: caseList];
            
        custDetailsList = new List <CustomerWrapper>();
        disableCreateBIR = TRUE;
    }
    
    public class CustomerWrapper{
        public Boolean isBaggageLost {get; set;}
        public Journey_Detail__c jDetail {get; set;}
        public CustomerWrapper(Journey_Detail__c jDetail){
            this.isBaggageLost = FALSE;
            this.jDetail = jDetail;
        }
    }
}