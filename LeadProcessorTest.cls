@isTest
private class LeadProcessorTest {
    @testSetup
    private static void recordEntry(){
        List<Lead> ldList = new List<Lead>();
        for(Integer i =1; i<=200;i=i+1){
            Lead ld = new Lead();
            ld.LastName = 'Dummy '+i;
            ld.Company = 'Stark Industries';
            if(Math.mod(i, 2)!=0){
                ld.LeadSource='Purchased List';
                ld.Status = 'Closed - Converted';
                ld.Rating = 'Warm';
            }
            else if(Math.mod(i, 2)==0){
                ld.LeadSource = 'Phone Inquiry';
                ld.Status = 'Working - Contacted';
                ld.Rating = 'Warm';
            }
            ldList.add(ld);
        }
        insert ldList;
    }
    
    @isTest
    private static void executeTest(){
        LeadProcessor lp = new LeadProcessor();
        Test.startTest();
        Database.executeBatch(lp);
        Test.stopTest();
    }
}