<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Date_on_Target</fullName>
        <field>Date__c</field>
        <formula>DATE(Year__c,
CASE(TEXT(Month__c), 
&apos;Jan&apos;	,01,
&apos;Feb&apos;	,02,
&apos;Mar&apos;	,03,
&apos;Apr&apos;	,04,
&apos;May&apos;	,05,
&apos;Jun&apos;	,06,
&apos;Jul&apos;	,07,
&apos;Aug&apos;	,08,
&apos;Sep&apos;	,09,
&apos;Oct&apos;	,10,
&apos;Nov&apos;	,11,
&apos;Dec&apos;	,12,
00),
01)</formula>
        <name>Update Date on Target</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_No_of_Days_in_Month_on_Target</fullName>
        <description>Updates the  No. of Days in Month on Target object</description>
        <field>Days_in_Month__c</field>
        <formula>IF(
  MONTH( Date__c ) = 12,
  DAY(DATE( YEAR( Date__c ), 12, 31 )),
  DAY(DATE( YEAR( Date__c ), MONTH ( Date__c ) + 1, 1 ) - 1) 
)</formula>
        <name>Update No. of Days in Month on Target</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Calculate No%2E of Days in Month</fullName>
        <actions>
            <name>Update_No_of_Days_in_Month_on_Target</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Calculates the No. of days in the month on Target Object</description>
        <formula>OR(ISNEW(),ISCHANGED(Date__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Date on Target</fullName>
        <actions>
            <name>Update_Date_on_Target</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(ISNEW() ,ISCHANGED (Month__c), ISCHANGED(Year__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
