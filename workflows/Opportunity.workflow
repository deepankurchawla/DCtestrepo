<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_Email_alert_to_Opportunity_Owner_for_Contract_Renewal_Date</fullName>
        <description>Send Email alert to Opportunity Owner for Contract Renewal Date</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Cargo_Templates/Contract_Expiration_Email_Alert</template>
    </alerts>
    <rules>
        <fullName>Send Email Alert for Air to Air Cargo Opportunity Renewal</fullName>
        <active>true</active>
        <description>Send Email Alert for Air to Air Cargo Opportunity Renewal</description>
        <formula>AND(  RecordType.DeveloperName==&apos;Air_to_Air&apos;,  NOT(ISBLANK(Contract_End_Date__c))  )</formula>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Email_alert_to_Opportunity_Owner_for_Contract_Renewal_Date</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Opportunity.Contract_End_Date__c</offsetFromField>
            <timeLength>-30</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Send Email Alert for Door to Door Cargo Opportunity Renewal</fullName>
        <active>true</active>
        <description>Send Email Alert for Door to Door Cargo Opportunity Renewal</description>
        <formula>AND(     RecordType.DeveloperName==&apos;Door_to_Door&apos;,     NOT(ISBLANK(Contract_End_Date__c))    )</formula>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Email_alert_to_Opportunity_Owner_for_Contract_Renewal_Date</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Opportunity.Contract_End_Date__c</offsetFromField>
            <timeLength>-30</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
