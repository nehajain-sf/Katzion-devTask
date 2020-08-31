/**
* Description : Class called by Transaction Process Builder when Transaction Count is equal to child records' count.
* Created By : Neha Jain
* Created On : Aug 31st, 2020
* Modified On : Sep 1, 2020
*/
public class TransactionInvocable {
    @InvocableMethod
    public static void invokeapexcallout(list<Transaction__c> transactionRec) {
        TransactionItemDetailsServices.transactionREST1(transactionRec[0].id);
    }
}