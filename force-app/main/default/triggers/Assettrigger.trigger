trigger Assettrigger on Asset (before insert, before update) {
    if (trigger.IsBefore && trigger.isUpdate){
    Assethandler.Assethandlerupdate(trigger.New,Trigger.Old,
    trigger.NewMap,Trigger.OldMap);
}

if(trigger.isBefore && trigger.isInsert){
    Assethandler.Assethandlerupdate(trigger.New,Trigger.Old,
    trigger.NewMap,Trigger.OldMap);
}
}
