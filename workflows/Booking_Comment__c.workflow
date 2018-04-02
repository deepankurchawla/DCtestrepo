<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Created_Date_Navitaire</fullName>
        <field>Created_Date__c</field>
        <formula>Created_Date__c + 0.2292</formula>
        <name>Update Created Date (Navitaire)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update Created Date %28Navitaire%29</fullName>
        <actions>
            <name>Update_Created_Date_Navitaire</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
