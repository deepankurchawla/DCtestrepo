<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Case_Creation_AutoResponse</fullName>
        <description>Case Creation AutoResponse</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Spicejet_Auto_Response</template>
    </alerts>
    <alerts>
        <fullName>Case_MileStone_Violated</fullName>
        <description>Case MileStone Violated</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>shalu.rana@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>varuna.ahlawat@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Milestone_related_Templates/Case_MileStone_Violated</template>
    </alerts>
    <alerts>
        <fullName>Case_MileStone_Violated_Warning</fullName>
        <description>Case MileStone Violated Warning</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>shalu.rana@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>varuna.ahlawat@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Milestone_related_Templates/Case_MileStone_Violation_Warning</template>
    </alerts>
    <alerts>
        <fullName>Case_resolution_violated</fullName>
        <description>Case resolution violated</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>shalu.rana@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>varuna.ahlawat@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Milestone_related_Templates/Case_Resolution_Violated</template>
    </alerts>
    <alerts>
        <fullName>Case_resolution_violated_warning</fullName>
        <description>Case resolution violated warning</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>shalu.rana@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>varuna.ahlawat@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Milestone_related_Templates/Case_Resolution_Violation_Warning</template>
    </alerts>
    <alerts>
        <fullName>First_Response_violation_CX</fullName>
        <description>First Response violation CX</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>shalu.rana@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>varuna.ahlawat@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Milestone_related_Templates/First_Response_Violated</template>
    </alerts>
    <alerts>
        <fullName>First_Response_violation_Warning_CX</fullName>
        <description>First Response violation Warning CX</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>shalu.rana@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>varuna.ahlawat@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Milestone_related_Templates/First_Response_Violation_Warning</template>
    </alerts>
    <alerts>
        <fullName>New_Case_Created</fullName>
        <description>New Case Created</description>
        <protected>false</protected>
        <recipients>
            <recipient>admin.ho@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SUPPORTCaseescalationnotificationSAMPLE</template>
    </alerts>
    <alerts>
        <fullName>New_Cases_Created</fullName>
        <ccEmails>brijendra.sinsinwar@spicejet.com</ccEmails>
        <description>New Cases Created</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SUPPORTCaseescalationnotificationSAMPLE</template>
    </alerts>
    <alerts>
        <fullName>Notify_Contact_Ground_Staff_Auto_Response</fullName>
        <description>Notify Contact - Ground Staff Auto Response</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Spicejet_Auto_Response_Ground_Staff</template>
    </alerts>
    <alerts>
        <fullName>Priority_Handling</fullName>
        <description>Priority Handling</description>
        <protected>false</protected>
        <recipients>
            <recipient>Customer_Experience_Team</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>binu060@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>deepa085@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>isha.gandhi@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>niti166@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Priority_Handling</template>
    </alerts>
    <alerts>
        <fullName>Response_Needed</fullName>
        <description>Response Needed</description>
        <protected>false</protected>
        <recipients>
            <recipient>binu060@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>deepa085@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>niti166@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Response_Needed</template>
    </alerts>
    <alerts>
        <fullName>Response_from_Concerned_Deptartment_Violation_Warning</fullName>
        <description>Response from Concerned Deptartment Violation Warning</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>shalu.rana@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>varuna.ahlawat@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Milestone_related_Templates/Response_from_Concerned_Dept_Violation_Warning</template>
    </alerts>
    <fieldUpdates>
        <fullName>Eng_MCC_Staff_Error_Update_Status</fullName>
        <description>Eng/MCC-Staff Error-Update Status</description>
        <field>Status</field>
        <literalValue>Waiting on Concerned Department</literalValue>
        <name>Eng/MCC-Staff Error-Update Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Isha</fullName>
        <field>OwnerId</field>
        <lookupValue>isha.gandhi@spicejet.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Isha</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Niti</fullName>
        <field>OwnerId</field>
        <lookupValue>niti166@spicejet.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Niti</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rule</fullName>
        <field>OwnerId</field>
        <lookupValue>binu060@spicejet.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Rule</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rule1</fullName>
        <field>OwnerId</field>
        <lookupValue>pradeep002@spicejet.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Rule1</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rule10</fullName>
        <field>OwnerId</field>
        <lookupValue>ashangban0761@spicejet.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Rule10</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rule11</fullName>
        <field>OwnerId</field>
        <lookupValue>sumit987@spicejet.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Rule11</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rule12</fullName>
        <field>OwnerId</field>
        <lookupValue>coolappadmin@spicejet.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Rule12</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rule3</fullName>
        <field>OwnerId</field>
        <lookupValue>deepa085@spicejet.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Rule5</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rule4</fullName>
        <field>OwnerId</field>
        <lookupValue>nishat629922@spicejet.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Rule4</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rule6</fullName>
        <field>OwnerId</field>
        <lookupValue>neha311@spicejet.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Rule6</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rule7</fullName>
        <field>OwnerId</field>
        <lookupValue>ankit962@spicejet.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Rule7</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rule8</fullName>
        <field>OwnerId</field>
        <lookupValue>pooja326@spicejet.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Rule8</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rule9</fullName>
        <field>OwnerId</field>
        <lookupValue>neha456@spicejet.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Rule9</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Arrival_Time</fullName>
        <field>Arrival_Time__c</field>
        <formula>Flight_Record__r.Arrival_Time__c</formula>
        <name>Set Arrival Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Departure_Time</fullName>
        <field>Departure_Time__c</field>
        <formula>Flight_Record__r.Departure_Time__c</formula>
        <name>Set Departure Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Flight_No</fullName>
        <field>Flight_No__c</field>
        <formula>Flight_Record__r.Name</formula>
        <name>Set Flight No.</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_PNR</fullName>
        <field>PNR_No__c</field>
        <formula>Flight_Record__r.Booking__r.Name</formula>
        <name>Set PNR</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Transport_Declaration</fullName>
        <field>OwnerId</field>
        <lookupValue>Res_Admin</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Transport Declaration</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Cargo_Case_owner_Cargo_Cases</fullName>
        <description>Update Cargo Case owner=Cargo Unassigned Cases</description>
        <field>OwnerId</field>
        <lookupValue>Cargo_Unassigned_Cases</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Update Cargo Case owner=Cargo Cases</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Onwer</fullName>
        <field>OwnerId</field>
        <lookupValue>Unassigned</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Update Case Onwer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Status_Escalated</fullName>
        <description>Update Case Status=Escalated</description>
        <field>Status</field>
        <literalValue>Escalated</literalValue>
        <name>Update Case Status=Escalated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_owner_for_Cargo_Cases</fullName>
        <description>Update Case owner for Cargo Cases originated from Email:spiceExpress@spicejet.com</description>
        <field>OwnerId</field>
        <lookupValue>Cargo_Unassigned_Emails</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Update Case owner for Cargo Cases</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_recordtype_to_Others_for_Twi</fullName>
        <description>Update Case recordtype to Others for Twitter</description>
        <field>RecordTypeId</field>
        <lookupValue>Others</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update Case recordtype to Others for Twi</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Origin_as_Airport</fullName>
        <field>Origin</field>
        <literalValue>Airport</literalValue>
        <name>Update Origin as Airport</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Process_Builder_Checkbox</fullName>
        <field>Is_Process_Builder_Executing__c</field>
        <literalValue>0</literalValue>
        <name>Update Process Builder Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_to_Escalated</fullName>
        <field>Status</field>
        <literalValue>Escalated</literalValue>
        <name>Update Status to Escalated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_to_Waiting_on_concerned_D</fullName>
        <description>Update Status to Waiting on concerned Department</description>
        <field>Status</field>
        <literalValue>Waiting on Concerned Department</literalValue>
        <name>Update Status to Waiting on concerned D</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_Status</fullName>
        <field>Status</field>
        <literalValue>Waiting on Concerned Department</literalValue>
        <name>update Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Assign cargo cases logged by Reservations to Queue</fullName>
        <actions>
            <name>Update_Cargo_Case_owner_Cargo_Cases</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Assign cargo cases logged by Reservations to Queue-Cargo Unassigned Cases</description>
        <formula>AND(CreatedBy.Profile.Name ==&apos;Cargo Reservations&apos;, 
    RecordType.DeveloperName==&apos;Cargo&apos;
   )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Assign to Unassigned Queue</fullName>
        <actions>
            <name>Update_Case_Onwer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
    OR(
        CreatedBy.Profile.Name  == &apos;Reservations - Agents&apos;,
        CreatedBy.Profile.Name  == &apos;Ground Services and Airports&apos;,
CreatedBy.Profile.Name  == &apos;Ground Services and Airports - Team Leads&apos;,
CreatedBy.Profile.Name  == &apos;Reservations - Team Leads&apos;
    ),
    NOT( IsClosed )
)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Case creation autoresponse</fullName>
        <actions>
            <name>Case_Creation_AutoResponse</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Case creation autoresponse</description>
        <formula>AND(ISPICKVAL(Type, &apos;Complaint&apos;), 
NOT(ISBLANK( ContactId )),
NOT(ISBLANK( Contact.Email )),  
OR(
CreatedBy.Profile.Name != &apos;Ground Services and Airports&apos;,
CreatedBy.Profile.Name != &apos;Ground Services and Airports - Team Leads&apos;
)
)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Case creation autoresponse - Ground Staff</fullName>
        <actions>
            <name>Notify_Contact_Ground_Staff_Auto_Response</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Case creation autoresponse for Ground Staff Cases</description>
        <formula>AND(ISPICKVAL(Type, &apos;Complaint&apos;), 
NOT(ISBLANK( ContactId )),
NOT(ISBLANK( Contact.Email )),  
OR(
CreatedBy.Profile.Name == &apos;Ground Services and Airports&apos;,
CreatedBy.Profile.Name == &apos;Ground Services and Airports - Team Leads&apos;
)
)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Isha</fullName>
        <actions>
            <name>Isha</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Relevant_Person__c</field>
            <operation>equals</operation>
            <value>Isha Gandhi</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Record_Type__c</field>
            <operation>equals</operation>
            <value>Reservation Operations</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>New Case Created</fullName>
        <actions>
            <name>New_Case_Created</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>New_Cases_Created</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Arrival_Station__c</field>
            <operation>equals</operation>
            <value>Kolkata (CCU)</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Niti</fullName>
        <actions>
            <name>Niti</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Relevant_Person__c</field>
            <operation>equals</operation>
            <value>Niti Arora</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Record_Type__c</field>
            <operation>equals</operation>
            <value>Reservation Operations</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Priority Handling</fullName>
        <actions>
            <name>Priority_Handling</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>Critical</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pull Flight Details from Journey Record</fullName>
        <actions>
            <name>Update_Process_Builder_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Is_Process_Builder_Executing__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Pulls the flight related details from Journey record selected on Case</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Response Needed</fullName>
        <actions>
            <name>Response_Needed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Response_Duration_hh_mm__c</field>
            <operation>greaterThan</operation>
            <value>48.00</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Reservation Operations</value>
        </criteriaItems>
        <description>Please Respond.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rule</fullName>
        <actions>
            <name>Rule</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Relevant_Person__c</field>
            <operation>equals</operation>
            <value>Binu Balachandran</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Record_Type__c</field>
            <operation>equals</operation>
            <value>Reservation Operations</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rule10</fullName>
        <actions>
            <name>Rule10</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Relevant_Person__c</field>
            <operation>equals</operation>
            <value>Ashangbam Diana</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Record_Type__c</field>
            <operation>equals</operation>
            <value>Reservation Operations</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rule11</fullName>
        <actions>
            <name>Rule11</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Relevant_Person__c</field>
            <operation>equals</operation>
            <value>Sumit Sharma</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Record_Type__c</field>
            <operation>equals</operation>
            <value>Reservation Operations</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rule12</fullName>
        <actions>
            <name>Rule12</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Relevant_Person__c</field>
            <operation>equals</operation>
            <value>Sandeep Sharma</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Record_Type__c</field>
            <operation>equals</operation>
            <value>Reservation Operations</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rule2</fullName>
        <actions>
            <name>Rule1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Relevant_Person__c</field>
            <operation>equals</operation>
            <value>Pradeep Shah</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Record_Type__c</field>
            <operation>equals</operation>
            <value>Reservation Operations</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rule4</fullName>
        <actions>
            <name>Rule4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Relevant_Person__c</field>
            <operation>equals</operation>
            <value>Nishat Khan</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Record_Type__c</field>
            <operation>equals</operation>
            <value>Reservation Operations</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Rule5</fullName>
        <actions>
            <name>Rule3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Relevant_Person__c</field>
            <operation>equals</operation>
            <value>Deepa Jain</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Record_Type__c</field>
            <operation>equals</operation>
            <value>Reservation Operations</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rule6</fullName>
        <actions>
            <name>Rule6</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Relevant_Person__c</field>
            <operation>equals</operation>
            <value>Neha Chadha</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Record_Type__c</field>
            <operation>equals</operation>
            <value>Reservation Operations</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rule7</fullName>
        <actions>
            <name>Rule7</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Relevant_Person__c</field>
            <operation>equals</operation>
            <value>Ankit Raghav</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Record_Type__c</field>
            <operation>equals</operation>
            <value>Reservation Operations</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rule8</fullName>
        <actions>
            <name>Rule8</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Relevant_Person__c</field>
            <operation>equals</operation>
            <value>Pooja Panwar</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Record_Type__c</field>
            <operation>equals</operation>
            <value>Reservation Operations</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rule9</fullName>
        <actions>
            <name>Rule9</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Relevant_Person__c</field>
            <operation>equals</operation>
            <value>Neha Kadian</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Record_Type__c</field>
            <operation>equals</operation>
            <value>Reservation Operations</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Team Lead</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Case.Relevant_Person__c</field>
            <operation>equals</operation>
            <value>Neha Chadha,Ankit Raghav,Nishat Khan,Pooja Panwar,Neha Kadian,Ashangbam Diana,Sumit Sharma,Sandeep Sharma</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Transport Declaration</fullName>
        <actions>
            <name>Transport_Declaration</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Transport_Declaration__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Case recordtype to Others for Twitter</fullName>
        <actions>
            <name>Update_Case_recordtype_to_Others_for_Twi</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Twitter</value>
        </criteriaItems>
        <description>Update Case recordtype to Others for Twitter</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Email originated Cargo Case Owner to Cargo Unassigned Emails Queue</fullName>
        <actions>
            <name>Update_Case_owner_for_Cargo_Cases</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Update Email originated Cargo Case Owner to Cargo Unassigned Emails Queue</description>
        <formula>AND(RecordType.DeveloperName==&apos;Cargo&apos;,
    ISPICKVAL(Origin,&apos;Email&apos;) 
   )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Origin for Ground Services team</fullName>
        <actions>
            <name>Update_Origin_as_Airport</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(
    $Profile.Name == &apos;Ground Services and Airports&apos;,
    $Profile.Name == &apos;Ground Services and Airports - Team Leads&apos;
)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
