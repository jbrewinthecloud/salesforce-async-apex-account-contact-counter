public class AccountProcessor {

    @future
    public static void countContacts(List<Id> accountIds) {
        List<Account> accountsToUpdate = [
            SELECT Id, Number_Of_Contacts__c,
                   (SELECT Id FROM Contacts)
            FROM Account
            WHERE Id IN :accountIds
        ];

        for (Account acc : accountsToUpdate) {
            Integer contactCount = acc.Contacts != null ? acc.Contacts.size() : 0;
            acc.Number_Of_Contacts__c = contactCount;
        }

        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}
