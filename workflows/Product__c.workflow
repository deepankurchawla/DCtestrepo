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
        <template>SpiceJet_Sales_Templates/Create_Add_On_Product_Navitaire_Id</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_on_Navitaire_Id_creation</fullName>
        <description>Email Alert on Navitaire Id creation</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SpiceJet_Sales_Templates/Add_On_Product_Navitaire_creation_notification</template>
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
        <template>SpiceJet_Sales_Templates/Add_on_Product_Approval_Request_Step_1</template>
    </alerts>
    <alerts>
        <fullName>Email_to_Sales_Head</fullName>
        <description>Email to Sales Head</description>
        <protected>false</protected>
        <recipients>
            <recipient>shilpa.bhatia@spicejet.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SpiceJet_Sales_Templates/Add_on_Product_Approval_Request</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Approval_Status</fullName>
        <field>Status__c</field>
        <literalValue>Approved by Central Coordinator</literalValue>
        <name>Update Approval Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_Approved</fullName>
        <field>Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Update Status - Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_Rejected</fullName>
        <field>Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Update Status - Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_Submitted_for_Approval</fullName>
        <field>Status__c</field>
        <literalValue>Submitted for Approval</literalValue>
        <name>Update Status - Submitted for Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Notification on Navitaire Id Creation</fullName>
        <actions>
            <name>Email_Alert_on_Navitaire_Id_creation</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(     NOT(ISNEW()),     Created_in_Navitaire__c,     Created_in_Navitaire__c != PRIORVALUE(Created_in_Navitaire__c)  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
