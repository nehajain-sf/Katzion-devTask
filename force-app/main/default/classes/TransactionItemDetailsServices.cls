/**
* Description : Web service class for REST API requests to send transaction and transaction item data to external system.
* Created By : Neha Jain
* Created On : Aug 31st, 2020
* Modified On : Sep 1, 2020
*/
public class TransactionItemDetailsServices {
    
    @future(Callout=true)
    public static void transactionREST1(Id transactionId){
        
        List<TransactionItem__c> itemList = new List<TransactionItem__c>();
        List<TransactionItemWrapper> transactionItemList = new List<TransactionItemWrapper>();
        itemList = [Select Id, Name, Item_Cost__c from TransactionItem__c where Transaction__c =: transactionId];
        for(TransactionItem__c tItem : itemList){
            TransactionItemWrapper wrapper = new TransactionItemWrapper();
            wrapper.key.transactionItemId = tItem.Id;
            wrapper.value.transactionItemName = tItem.Name;
            wrapper.value.transactionItemCost = tItem.Item_Cost__c;
            transactionItemList.add(wrapper);
        }
        
        //create JSON from wrapper list
        String jsonBody = JSON.serialize(transactionItemList);
        System.debug('jsonBody===='+jsonBody);
        
        Http http1 = new Http();
        HttpRequest request1 = new HttpRequest();
        
        //end point = end point + authentication parameter (not provided)
        request1.setEndpoint('');
        request1.setMethod('POST');
        request1.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request1.setBody(jsonBody);
        HttpResponse response1 = new HttpResponse();
        if(!Test.isRunningTest()){
             response1 = http1.send(request1);
        }
            
        
        else {
            response1.setStatusCode(201);
        }
        
        if(response1.getStatusCode() == 201) {       
            
            
            //If first request is successfull then proceed with another call
            //System.debug(response1.getBody());
            Transaction__c transactionRec = [Select Id, Total_Cost__c, Total_Discount__c, Name, Transaction_Count__c from Transaction__c where Id =: transactionId limit 1];
            TransactionWrapper wrapper = new TransactionWrapper();
            wrapper.key.transactionId = transactionRec.Id;
            wrapper.value.transactionName = transactionRec.Name;
            wrapper.value.transactionCost = transactionRec.Total_Cost__c;
            wrapper.value.transactionDiscount = transactionRec.Total_Discount__c;
            wrapper.value.transactionCount = transactionRec.Transaction_Count__c;
            
            String jsonTransactionBody = JSON.serialize(wrapper);
            System.debug('jsonTransactionBody===='+jsonTransactionBody);
            
            Http http2 = new Http();
            HttpRequest request2 = new HttpRequest();
            request2.setEndpoint('');
            request2.setMethod('POST');
            request2.setHeader('Content-Type', 'application/json;charset=UTF-8');
            request2.setBody(jsonTransactionBody);
            HttpResponse response2 = new HttpResponse();
            // Parse the JSON response
            if (!Test.isRunningTest()) {
                response2 = http2.send(request2);
                System.debug('The status code returned  ' +
                             response2.getStatusCode() + ' ' + response2.getStatus());
            } 
        }
    }
}