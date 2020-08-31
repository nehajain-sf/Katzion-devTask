/**
* Description : Wrapper Class for Transaction object
* Created By : Neha Jain
* Created On : Aug 31st, 2020
* Modified On : Sep 1, 2020
*/
public class TransactionWrapper {
    public Keys key = new Keys();
    public Values value = new Values();
    
    public class Keys {
        public Id transactionId;
    }
    
    public class Values {
        public String transactionName;
        public Decimal transactionCost;
        public Decimal transactionDiscount;
        public Decimal transactionCount;
    }
    
   
}