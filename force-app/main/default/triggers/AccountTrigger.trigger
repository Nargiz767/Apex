trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    if (trigger.isBefore){
        AccountTriggerHandler.updateDescription(trigger.New,Trigger.Old,trigger.NewMap,Trigger.OldMap);
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        //HERE we call handler method to update all contacts VIP field
        AccountTriggerHandler.updateVIPforContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

}
   /* 
    map<id, account> accTriggerOldMap = trigger.oldMap;
    map<id, account> accTriggerNewMap = trigger.newMap;
    set<id> accountIds = accTriggerNewMap.keySet(); //all the IDS.
    integer countWebsite = 0;

    for (Id eachId : accountIds) {
        //get NEW account value from NewMap - id is same in newmap and oldmap
        account newAcc = accTriggerNewMap.get(eachId);
        string newWebsite = newAcc.Website;
        system.debug('** newWebsite -> ' + newWebsite);
        //get OLD account value from OldMap
        account oldAcc = accTriggerOldMap.get(eachId);
        string oldWebsite = oldAcc.Website;
        system.debug('** oldWebsite -> ' + oldWebsite);

        if (newWebsite != oldWebsite) {
            system.debug('Account is ' + newAcc.Name + ', website changed to ' + newwebsite);
            countwebsite++;
        }
       
    }
    system.debug('website updated for # of accounts => ' + countwebsite);
}

*/

/*
     //old account name and new account name using ONE for loop.
        
        //get set of id using map.
        set<id> accountIds = accTriggerNewMap.keySet();
        for (Id eachId : accountIds) {
            //get NEW account value from NewMap - id is same in newmap and oldmap
            account newAcc = accTriggerNewMap.get(eachId);
            system.debug('NEW Acc Name is ' +  newacc.Name);
            //get OLD account value from OldMap
            account oldAcc = accTriggerOldMap.get(eachId);
            system.debug('Old Acc Name is ' +  oldacc.Name);
        }
    }

*/

/*
    //what elements we have in these maps.
    if (Trigger.isBefore && Trigger.isInsert) {
        system.debug('before insert old map => ' + accTriggerOldMap);
        system.debug('before insert new map => ' + accTriggernewMap);
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('after insert old map => ' + accTriggerOldMap);
        system.debug('after insert new map => ' + accTriggernewMap);
    }

    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('before Update old map => ' + accTriggerOldMap);
        system.debug('before Update new map => ' + accTriggernewMap);
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('after Update old map => ' + accTriggerOldMap);
        system.debug('after Update new map => ' + accTriggernewMap);
    }
}
*/

/*
  list <account> accTriggerNew = trigger.new; 
  if (Trigger.isBefore && Trigger.isUpdate){
    system.debug('Before  UPDATE record '+ accTriggerNew);
    system.debug('Before UPDATE record size '+ accTriggerNew.size());

    for (account eachacc: accTriggerNew){
        system.debug('Before UPDATE each acc id is '+ eachacc.id + ', each acc name is  ' + eachacc.name);
    }
}
    if (Trigger.isAfter && Trigger.isInsert){
        system.debug('newly UPDATErecord '+ accTriggerNew);
        system.debug('newly UPDATE record size '+ accTriggerNew.size());
        
        for (account eachacc: accTriggerNew){
            system.debug('after UPDATE each acc id is '+ eachacc.id + ', each acc name is  ' + eachacc.name);
        }
    }


  /*
  if (Trigger.isBefore && Trigger.isInsert){
    system.debug('Before  inserted record '+ accTriggerNew);
    system.debug('Before inserted record size '+ accTriggerNew.size());

    for (account eachacc: accTriggerNew){
        system.debug('Before each acc id is '+ eachacc.id + ', each acc name is  ' + eachacc.name);
    }
}
    if (Trigger.isAfter && Trigger.isInsert){
        system.debug('newly inserted record '+ accTriggerNew);
        system.debug('newly inserted record size '+ accTriggerNew.size());
        
        for (account eachacc: accTriggerNew){
            system.debug('each acc id is '+ eachacc.id + ', each acc name is  ' + eachacc.name);
        }
    }

*/




/*
    // insert part

    if (trigger.isInsert && trigger.isAfter){
        system.debug('account after insert trigger ');
    }
    
    if (trigger.isInsert && trigger.isBefore){
        system.debug('account before insert trigger ');
    }
// update part 

    if (trigger.isUpdate && trigger.isAfter){
        system.debug('account after UPDATE trigger ');
    }
    
    if (trigger.isUpdate && trigger.isBefore){
        system.debug('account before UPDATE trigger ');
    }
    
}  

*/




/*
    // before insert
    //system.debug('account before INSERT trigger called');
    //system.debug('account before UPDATE trigger called');
  
    if (Trigger.isBefore){
    system.debug('account before insert trigger called');
    }
if (Trigger.isAfter){
 system.debug('account after trigger called');
}

trigger AccountTrigger on Account (before insert,before update) 
    if (Trigger.isInsert){
        system.debug('contact fire before INSERT first before ');
    }
     if (trigger.isUpdate){
        system.debug('before  UPDATE fire now ');
     }

     */

     // OLD AND NEW ACCOUNT : NEW TOPIC 
/*
     trigger accountTrigger2 on Account  (before insert, before update, after insert, after update) {
        //system.debug('account after trigger called');
     
        
            if (trigger.isBefore && trigger.isUpdate) {
                List<account> accTriggerOld = trigger.old;//OLD (previous) values of records
                for (account oldAcc : accTriggerOld) {
                    system.debug('old acc name = ' + oldAcc.Name + ', old acc id => ' + oldAcc.Id);
                }
        
                List<account> accTriggerNew = trigger.New;//New (updated) values of records
                for (account newAcc : accTriggerNew) {
                    system.debug('new acc name = ' + newAcc.Name + ', new acc id => ' + newAcc.Id);
                }
            }
            
            /*
            if (Trigger.isBefore && Trigger.isInsert) {
                system.debug('account before insert trigger.old -> ' + trigger.old);
            }
            if (Trigger.isAfter && Trigger.isInsert) {
                system.debug('account after insert trigger.old -> ' + trigger.old);
            }
            if (Trigger.isBefore && Trigger.isUpdate) {
                system.debug('account before Update trigger.old -> ' + trigger.old);
            }
            if (Trigger.isAfter && Trigger.isUpdate) {
                system.debug('account after Update trigger.old -> ' + trigger.old);
            }
            */
        
        
        
            /*
            list<account> accTriggerNew = trigger.new;
            if (Trigger.isBefore && Trigger.isUpdate) {
                system.debug('BEFORE UPDATE new record ==> '  + accTriggerNew);
                system.debug('BEFORE UPDATE  new accounts size ==> ' + accTriggerNew.size());
        
                for (account eachAcc : accTriggerNew) {
                    system.debug('BEFORE UPDATE each acc id is ' + eachAcc.Id + ', each acc name is ' + eachacc.Name);
                }
            }
            if (Trigger.isAfter && Trigger.isUpdate) {
                system.debug('AFTER newly UPDATE record ==> '  + accTriggerNew);
                system.debug('AFTER newly UPDATE accounts size ==> ' + accTriggerNew.size());
        
                for (account eachAcc : accTriggerNew) {
                    system.debug('AFTER UPDATE each acc id is ' + eachAcc.Id + ', each acc name is ' + eachacc.Name);
                }
            }*/
        
        
        
           /*if (Trigger.isBefore && Trigger.isInsert) {
                system.debug('BEFORE INSERT new record ==> '  + accTriggerNew);
                system.debug('BEFORE INSERT  new accounts size ==> ' + accTriggerNew.size());
        
                for (account eachAcc : accTriggerNew) {
                    system.debug('BEFORE each acc id is ' + eachAcc.Id + ', each acc name is ' + eachacc.Name);
                }
            }
            if (Trigger.isAfter && Trigger.isInsert) {
                system.debug('AFTER newly inserted record ==> '  + accTriggerNew);
                system.debug('AFTER newly inserted accounts size ==> ' + accTriggerNew.size());
        
                for (account eachAcc : accTriggerNew) {
                    system.debug('AFTER each acc id is ' + eachAcc.Id + ', each acc name is ' + eachacc.Name);
                }
            }*/
        
        
            /*
            //insert
            if (trigger.isInsert && trigger.isAfter) {
                system.debug('account after insert trigger called');
            }
        
            if (trigger.isInsert && trigger.isBefore) {
                system.debug('account before insert trigger called');
            }
            
            //update
            if (trigger.isUpdate && Trigger.isBefore) {
                system.debug('account Before UPDATE trigger called');
            }
            if (trigger.isUpdate && Trigger.isAfter) {
                system.debug('account after UPDATE trigger called');
            }*/
            
            
            
            /*//before insert
            if (Trigger.isInsert) {
                system.debug('account before INSERT trigger called.'); //when will this code run?
            }
            if (Trigger.isUpdate) {
                system.debug('account before UPDATE trigger called.');
            }
             */
        
            /*
            if (Trigger.isBefore) {
                system.debug('account before insert trigger called.');
            }
            if (Trigger.isAfter) {
                system.debug('account after insert trigger called');
            }
            */
    

