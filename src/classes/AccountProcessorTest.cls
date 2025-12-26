@IsTest
private class AccountProcessorTest {

    @IsTest
    static void testCountContacts() {
        Account accWithContacts = new Account(Name = 'Account With Contacts');
        Account accWithoutContacts = new Account(Name = 'Account Without Contacts');
        insert new List<Account>{ accWithContacts, accWithoutContacts };

        Contact c1 = new Contact(LastName = 'Test One', AccountId = accWithContacts.Id);
        Contact c2 = new Contact(LastName = 'Test Two', AccountId = accWithContacts.Id);
        insert new List<Contact>{ c1, c2 };

        Test.startTest();
        AccountProcessor.countContacts(new List<Id>{ accWithContacts.Id, accWithoutContacts.Id });
        Test.stopTest();

        Account refreshedAccWithContacts = [
            SELECT Number_Of_Contacts__c
            FROM Account
            WHERE Id = :accWithContacts.Id
        ];

        Account refreshedAccWithoutContacts = [
            SELECT Number_Of_Contacts__c
            FROM Account
            WHERE Id = :accWithoutContacts.Id
        ];

        System.assertEquals(2, refreshedAccWithContacts.Number_Of_Contacts__c);
        System.assertEquals(0, refreshedAccWithoutContacts.Number_Of_Contacts__c);
    }
}
