<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_PNR_No_field</fullName>
        <description>Update PNR No field on Journey details</description>
        <field>PNR_No__c</field>
        <formula>Booking__r.Name</formula>
        <name>Update PNR No field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Get PNR from Booking record</fullName>
        <actions>
            <name>Update_PNR_No_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Get PNR from Booking record to be used for searching</description>
        <formula>NOT(ISNULL(Booking__c))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
