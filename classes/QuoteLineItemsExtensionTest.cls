@isTest(SeeAllData=true)
private class QuoteLineItemsExtensionTest {
	public static testmethod void testCurrentQuote(){

        Pricebook2  standardPb = [select id, name, isActive from Pricebook2 where IsStandard = true limit 1];
    
        Product2 prod = new Product2(Name='test1',Family='Liner', IsActive=true);
        insert prod;
    
        PricebookEntry pbe = new PricebookEntry (Product2Id=prod.id,Pricebook2ID=standardPb.id,UnitPrice=50, isActive=true);
        insert pbe;
        
        Opportunity o = new Opportunity(Name='Testing Opportunity', StageName='New', CloseDate=system.today());
        insert o; 
        
        Quote q = new Quote(Name='Test', Pricebook2Id = standardPb.id, OpportunityId=o.id);
   		insert q; 
        
        QuoteLineItem QuoteLineItems = new QuoteLineItem(Description='Test Line Item', Product2Id=prod.id, QuoteId=q.id, PriceBookEntryID=pbe.id, Quantity=4, UnitPrice =pbe.UnitPrice);
        insert QuoteLineItems;
        
        Apexpages.StandardController sc = new Apexpages.StandardController(q);
        QuoteLineItemsExtension ext = new QuoteLineItemsExtension(sc);
        // System.assertEquals('firstlast@acme.com', leads[0].email);

    }
}