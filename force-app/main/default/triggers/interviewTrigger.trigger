trigger interviewTrigger on Account (after insert) {
    if(trigger.isAfter){
        if(trigger.isInsert){
        interview.creatAccount(trigger.new);
    }
}
}