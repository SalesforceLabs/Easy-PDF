public with sharing class QuoteLineItemsExtension{
    
    public Quote CurrentQuote { // getting or setting quote 
        get;
        set;
    }
    
    public List<QuoteLineItem> QuoteLineItems{ // getting or setting quotelineitems
        get;
        set;
    }
    
    public QuoteLineItemsExtension(ApexPages.StandardController controller){
        CurrentQuote =     // gets current quote record
            (Quote)controller.getRecord();
 
        if (Schema.sObjectType.QuoteLineItem.isAccessible()){
                
            QuoteLineItems = // gets quote line items and stores into list
                [
                    SELECT QuoteId, Product2Id, Quantity, Subtotal, Description, ListPrice 
                    FROM QuoteLineItem
                    WHERE QuoteId = :CurrentQuote.Id
                    ORDER BY LineNumber ASC
                ];
           }
    }
}