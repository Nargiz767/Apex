List<account > acc = [select id ,name,Active__c  from account where Active__c ='yes'];
ContactQueueableAssign ct= new ContactQueueableAssign (acc);
id jobId = system.enqueueJob(ct);