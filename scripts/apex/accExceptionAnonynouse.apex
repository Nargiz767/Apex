try {
    string s;
    s.toLowerCase();
 account acc= new account();
insert acc;   
} catch (exception ex) {
 system.debug('something went wrong'); 
 system.debug ('ex->'+ ex.getMessage()); 
 system.debug ('ex line number'+ ex.getLineNumber()); 
}


system.debug ('apex is simple');
