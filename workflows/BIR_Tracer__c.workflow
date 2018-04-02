<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_Baggage_found_notification</fullName>
        <description>Send Baggage found notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Baggage_Found_Notification</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Name</fullName>
        <field>Name</field>
        <formula>LEFT(RIGHT(TEXT(Airport__c),4),3)&amp;&apos;-&apos;&amp;BIR_Tracer_No__c</formula>
        <name>Update Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update BIR Tracer Name</fullName>
        <actions>
            <name>Update_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TRUE</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Owner</fullName>
        <actions>
            <name>Send_Baggage_found_notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.BIR_Tracer__c</field>
            <operation>equals</operation>
            <value>Found,Not Found</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
