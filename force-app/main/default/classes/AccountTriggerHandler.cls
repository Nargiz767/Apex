public class AccountTriggerHandler {
    public static void updateDescription(List<Account> accTriggerNew, List<account> accTriggerOld,
                                Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap) {
        for (account eachAcc : accTriggerNew) {
            boolean updateDesc = false;
            if (Trigger.isInsert && eachAcc.Active__c == 'Yes') {
                //just update field
                updateDesc = true;
            }
            //if account is updated.
                //check if active field is changed from not yes to yes
                //then update description
            if (Trigger.isUpdate) {
                //get old account using OldMAP
                Account oldAccount = accTriggerOldMap.get(eachAcc.Id);
                //get new account using newMap
                Account newAccount = accTriggerNewMap.get(eachAcc.Id);
                //oldAccount.Active__c != newAccount.Active__c
                if (eachAcc.Active__c == 'Yes' &&
                   oldAccount.Active__c != newAccount.Active__c ) {
                    updateDesc = true;
                }
            }
            if (updateDesc) {
                eachAcc.Description = 'Account is now active. Enjoy buddy!!';
            }
        }
    }
    public static void updateVIPforContacts(List<Account> accTriggerNew, List<account> accTriggerOld,
    Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap) {
//create set account ids were vip is changed
        //10 account -> 3 vip is changed.
set<id> accIds = new set<id>();
for (account eachAcc : accTriggerNew) {
    if (eachAcc.vip__c != accTriggerOldMap.get(eachAcc.id).vip__c) {
        accIds.add(eachAcc.Id);
    }
}

//get contacts for all those accounts
        //get contacts for all those 3 account. 10 contacts.
List<contact> allContacts = [select id, vip__c, accountId from contact where account.id in :accIds];

if(!allContacts.isEmpty()){
    //for loop on contacts
        //set vip for each contact with Account's vip field.
    for (contact eachCon : allContacts) {
        //get account's vip field
        //id contactAccId = eachCon.AccountId;
        //Account newAcc = accTriggerNewMap.get(contactAccId);
       // boolean accVIP = newAcc.vip__c;

      
     eachCon.vip__c = accTriggerNewMap.get(eachCon.AccountId).vip__c;
    }
    
    update allContacts;
}
}
 @future
 public static void NumberOfContact (set <id> accId){
    list <account > AccList =[select id,Number_Of_Contacts__c,(Select id from contacts)from account where id in: accId];
  list <account> uplist= new List <account>();
  for(account a: Acclist){
    a.Number_Of_Contacts__c = a.contacts.size();
    uplist.add(a);
  }
  update uplist;
}
}