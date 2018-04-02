<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>First_Response_Time</fullName>
        <field>Status</field>
        <literalValue>In Progress</literalValue>
        <name>First Response Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Task_Completion_DateTime</fullName>
        <description>Update Task Completion DateTime</description>
        <field>Task_Completed_On__c</field>
        <formula>NOW()</formula>
        <name>Update Task Completion DateTime</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update Task Completion Datetime</fullName>
        <actions>
            <name>Update_Task_Completion_DateTime</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.Status</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <description>Update Task Completion Datetime</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
