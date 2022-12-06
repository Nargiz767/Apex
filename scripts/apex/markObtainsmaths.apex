Map<string,integer> markobtainsmaths= new Map<string,integer>();
markobtainsmaths.put('0111CE112=>',40);
markobtainsmaths.put('0111CE102=>',19);
markobtainsmaths.put('0111CE100=>',33);
markobtainsmaths.put('0111CE098=>',40);
system.debug(markobtainsmaths);

for(string eachstr:markobtainsmaths.keySet()){
    system.debug('each student enrollment=>' + eachstr);
}

set <string> studenrollnumber = markobtainsmaths.keySet();
system.debug('all students present in the markobtainsmaths'+studenrollnumber);


set <string> uniqueRollNumberSet = markobtainsmaths.keySet();
for(string eachstd:uniqueRollNumberSet ){
    system.debug('all roll numbers here'+ eachstd );
}

list <integer> marksObtainList = markobtainsmaths.values();
for(integer eachmrk:marksObtainList ){
    system.debug ('students marks here =' +eachmrk);
}

list<integer> marksobtain = markobtainsmaths.values();
system.debug('all present marks in there='+ marksobtain);

for (integer eachmrk : markobtainsmaths.values()){
if ( eachmrk < 20){
   system.debug( eachmrk + 'is not qualified for next class');
}
}



