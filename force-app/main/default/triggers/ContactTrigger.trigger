trigger ContactTrigger on Contact (before insert, after insert, before update, after update) {
    if (Trigger.isBefore) {
        if (Trigger.isUpdate) {
            system.debug('we are in before update trigger.');
            ContactTriggerHandler.contactUpdateValidation1(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
           ContactTriggerHandler.contactUpdateValidation2 (Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        }
    }
   
} 




/*
        if (Trigger.isBefore){
            system.debug('contact fire first before . not saved');
        if(Trigger.isInsert){
            system.debug('we are in before insert');    
        }
        if (Trigger.isUpdate){
            system.debug('we rae in before update ');
        }
        }
         if (trigger.isAfter){
            system.debug('after fire AFTER .SBNC ');
            if(Trigger.isInsert){
                system.debug('we are inafter insert');    
            }
            if (Trigger.isUpdate){
                system.debug('we are in after update ');
         }
    
    } */
    
