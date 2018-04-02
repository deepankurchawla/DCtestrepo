<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Populate_Record_Type_Travel_Agency</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Travel_Agency</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Populate Record Type - Travel Agency</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Contact_field_on_Contact_for_acc</fullName>
        <description>Update Contact field on Contact for Account</description>
        <field>Contact__pc</field>
        <formula>IF(NOT(ISBLANK(PersonHomePhone)), SUBSTITUTE(SUBSTITUTE(SUBSTITUTE(SUBSTITUTE(PersonHomePhone, &quot;(&quot;, &quot;&quot;) ,&quot;)&quot;,&quot;&quot;),&quot;-&quot;,&quot;&quot;),&quot; &quot;,&quot;&quot;),
IF(NOT(ISBLANK(Work_Phone_Secondary_Phone__pc)), SUBSTITUTE(SUBSTITUTE(SUBSTITUTE(SUBSTITUTE(Work_Phone_Secondary_Phone__pc, &quot;(&quot;, &quot;&quot;) ,&quot;)&quot;,&quot;&quot;),&quot;-&quot;,&quot;&quot;),&quot; &quot;,&quot;&quot;), 
IF(NOT(ISBLANK(PersonOtherPhone)), SUBSTITUTE(SUBSTITUTE(SUBSTITUTE(SUBSTITUTE(PersonOtherPhone, &quot;(&quot;, &quot;&quot;) ,&quot;)&quot;,&quot;&quot;),&quot;-&quot;,&quot;&quot;),&quot; &quot;,&quot;&quot;), 
IF(NOT(ISBLANK(PersonEmail)),TEXT(VALUE(PersonEmail)),NULL))))</formula>
        <name>Update Contact field on Contact for acc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_External_ID</fullName>
        <field>External_Id__c</field>
        <formula>FirstName &amp; &quot;~&quot; &amp;  LastName &amp; &quot;~&quot; &amp;  Contact__pc</formula>
        <name>Update External ID</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Record_Type_Corporate</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Corporate</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update Record Type - Corporate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update Contact field on Contact for account</fullName>
        <actions>
            <name>Update_Contact_field_on_Contact_for_acc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update Contact field on Contact account</description>
        <formula>AND(
    IsPersonAccount ,
    RecordType.DeveloperName == &apos;PersonAccount&apos;,
    OR(
        ISNEW(),
        OR(
            ISCHANGED( PersonHomePhone ),
            ISCHANGED( Work_Phone_Secondary_Phone__pc ),
            ISCHANGED( PersonOtherPhone ),
            ISCHANGED( PersonEmail )
        )
    )
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update External ID</fullName>
        <actions>
            <name>Update_External_ID</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
    IsPersonAccount,
    RecordType.DeveloperName == &apos;PersonAccount&apos;,
    OR(
        ISNEW(),
        OR(
            ISCHANGED( FirstName ),
            ISCHANGED( LastName ),
            ISCHANGED( Contact__pc )
        )
    )
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Record Type - Corporate</fullName>
        <actions>
            <name>Update_Record_Type_Corporate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Record_Type_Name__c</field>
            <operation>equals</operation>
            <value>Corporate</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Record Type - Travel Agency</fullName>
        <actions>
            <name>Populate_Record_Type_Travel_Agency</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Record_Type_Name__c</field>
            <operation>equals</operation>
            <value>Travel_Agency</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
