/**
* Description : Wrapper Class for Transaction Item object
* Created By : Neha Jain
* Created On : Aug 31st, 2020
* Modified On : Sep 1, 2020
*/
public class TransactionItemWrapper {
    public Keys key = new Keys();
    public Values value = new Values();
    
    public class Keys {
        public Id transactionItemId;
    }
    public class Values {
        public String transactionItemName;
        public Decimal transactionItemCost;
    }
}