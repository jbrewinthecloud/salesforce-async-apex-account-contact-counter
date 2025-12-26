# Salesforce Async Apex – Account Contact Counter

This project showcases an example of **asynchronous Apex** using the `@future` annotation.

The goal is to build an Apex class that accepts a list of `Account` Ids, counts the number of related `Contact` records for each Account, and updates a custom field `Number_Of_Contacts__c` on the Account.

## 🧩 Scenario

A sales manager wants to quickly see how many Contacts exist for each Account without running a report. Instead of manually counting, we use Apex to:

1. Take a list of Account Ids  
2. Count related Contacts  
3. Store the total on the Account in a custom field: `Number_Of_Contacts__c`

## 🛠️ Tech Details

- Apex class: `AccountProcessor`
- Method: `countContacts(List<Id> accountIds)`
- Asynchronous processing with `@future`
- Custom field: `Account.Number_Of_Contacts__c` (Number)

## ✅ Test Coverage

Test class: `AccountProcessorTest`

The test:
- Creates an Account with 2 Contacts and one with 0 Contacts  
- Calls the future method inside `Test.startTest()` / `Test.stopTest()`  
- Asserts that:
  - The first Account shows `Number_Of_Contacts__c = 2`
  - The second shows `0`

Result: 100% coverage of `AccountProcessor`.

## 📂 Structure

```text
src/
  classes/
    AccountProcessor.cls
    AccountProcessorTest.cls

Possible Enhancements:
Convert to Queueable Apex for more flexibility
Add logging and error handling
Trigger-based automation when Contacts are created or deleted
