<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_ExternalId_on_Entitlement</fullName>
        <description>Update ExternalId on Entitlement</description>
        <field>External_Id__c</field>
        <formula>IF(ISBLANK(TEXT(Department__c)),&quot;&quot;,TEXT(Department__c))+ 
IF(ISBLANK(TEXT(Sub_Department__c)),&quot;&quot;,&quot;-&quot;+TEXT(Sub_Department__c))+ 
IF(ISBLANK(TEXT(Category__c)),&quot;&quot;,&quot;-&quot;+TEXT(Category__c))+ 
IF(ISBLANK(TEXT(Sub_Category__c)),&quot;&quot;,&quot;-&quot;+TEXT(Sub_Category__c))</formula>
        <name>Update ExternalId on Entitlement</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update ExternalId on Entitlement</fullName>
        <actions>
            <name>Update_ExternalId_on_Entitlement</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update ExternalId on Entitlement</description>
        <formula>OR(    ISNEW(),    OR(       ISBLANK(External_Id__c),       ISCHANGED(Department__c),       ISCHANGED(Category__c),       ISCHANGED(Sub_Department__c),       ISCHANGED(Sub_Category__c)        )       )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
