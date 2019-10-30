global class LeadProcessor implements Database.Batchable<sObject> {
    
    global Database.queryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT ID, Lastname, Status, Rating, LeadSource, Company FROM Lead');
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> ldList){
        for(Lead ld : ldList){
            ld.LeadSource = 'Dreamforce';
            ld.Rating = 'Hot';
        }
        update ldList;
    }
    global void finish(Database.BatchableContext bc){
        
    }
}