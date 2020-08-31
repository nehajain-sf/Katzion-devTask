@isTest
public class TransactionTestClass {
    
    static testMethod void testCase1() {
    
    Transaction__c transaction1 = new Transaction__c(name='transaction1',Total_Cost__c=300,
                                                     Total_Discount__c=45,Transaction_Count__c=2);
    Test.startTest();
    
    	insert transaction1;
        
        TransactionItem__c transactionItem1 = new TransactionItem__c(Name='transactionItem1',Transaction__c=transaction1.id,Item_Cost__c=200);
        TransactionItem__c transactionItem2 = new TransactionItem__c(Name='transactionItem2',Transaction__c=transaction1.id,Item_Cost__c=250);
    	insert transactionItem1;
        insert transactionItem2;
        
    Test.stopTest();                                                    
    }
    
}