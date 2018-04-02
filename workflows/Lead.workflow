<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alert_to_IT_Team_for_creating_Navitarie_Id</fullName>
        <description>Alert to IT Team for creating Navitarie Id</description>
        <protected>false</protected>
        <recipients>
            <recipient>it.helpdesk@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SpiceJet_Sales_Templates/Create_Navitaire_Id</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_on_Navitaire_Id_creation</fullName>
        <description>Email Alert on Navitaire Id creation</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SpiceJet_Sales_Templates/Travel_Agency_Corporate_Navitaire_creation_notification</template>
    </alerts>
    <alerts>
        <fullName>Email_to_Central_Coordinators</fullName>
        <description>Email to Central Coordinators</description>
        <protected>false</protected>
        <recipients>
            <recipient>Central_Sales_Coordinator</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SpiceJet_Sales_Templates/Lead_Approval_Request_Step_1</template>
    </alerts>
    <alerts>
        <fullName>Email_to_Sales_Head</fullName>
        <description>Email to Sales Head</description>
        <protected>false</protected>
        <recipients>
            <recipient>Sr_VP_Sales_and_Distribution</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SpiceJet_Sales_Templates/Lead_Approval_Request_VF</template>
    </alerts>
    <fieldUpdates>
        <fullName>Populate_Record_Type_Name</fullName>
        <field>Record_Type_Name__c</field>
        <formula>RecordType.DeveloperName</formula>
        <name>Populate Record Type Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Approval_Status</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Approved by Central Coordinator</literalValue>
        <name>Update Approval Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Approval_Status_Approved</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Update Approval Status - Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Approval_Status_Pending</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Submitted for Approval</literalValue>
        <name>Update Approval Status - Pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Approval_Status_Rejected</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Update Approval Status - Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Owner_to_Lead_Queue</fullName>
        <description>Update Owner to Lead Queue</description>
        <field>OwnerId</field>
        <lookupValue>Cargo_Unassigned</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Update Owner to Lead Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Assign to Cargo Door to Door Queue</fullName>
        <actions>
            <name>Update_Owner_to_Lead_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Assign to Cargo Door to Door Queue</description>
        <formula>AND(     CreatedBy.Profile.Name == &apos;Cargo Reservations&apos;,     RecordType.DeveloperName==&apos;Cargo_Door_to_Door&apos;    )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Notification on Navitaire Id Creation</fullName>
        <actions>
            <name>Email_Alert_on_Navitaire_Id_creation</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(  Created_in_Navitaire__c,  Created_in_Navitaire__c != PRIORVALUE(Created_in_Navitaire__c)  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Populate Record Type</fullName>
        <actions>
            <name>Populate_Record_Type_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(     ISNEW(),     ISCHANGED( RecordTypeId ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
