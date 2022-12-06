Map<string, string> mapName = new Map<string, string>();
mapName.put('usa','dollar');
mapName.put('japan','yen');
mapName.put('spain','euro');
mapName.put('netherland','euro');
mapName.put('usa','dollars');
mapName.put('india','rupee');
mapName.put('turkiye','lira');

system.debug(mapName);


string indiacurrency=mapName.get('india');
string country='turkiye';
string countrycurrency=mapName.get(country);
system.debug('india currency'+ '' +''+ indiacurrency);
system.debug(country + ''+'currency is' + ''+ countrycurrency);

// gel all countries (keys)
set<string> countryset=mapName.keySet();
system.debug('country set'+countryset);

List<string> currencyList =mapName.values();
system.debug('currecy list '+ currencyList);

set<string> countries=mapName.keySet();
for(string echcountru:countries ){
    system.debug('each countries are '+echcountru);
    //fetch currency using .get(key mothod)
    string echcurrency=mapName.get(echcountru);
    system.debug('each countries are '+echcountru);
      system.debug('each countries are '+echcountru+ 'ecah countries currency is '+echcurrency);
      
}