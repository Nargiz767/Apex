RankHandler rk=new RankHandler ();
string p=rk.rankprize(1);
system.debug('p1 is '+p);

string p1=rk.rankprize(2);
system.debug('p2 is '+p1);


string p3=rk.rankprize(5);
system.debug('p5 is '+p3);

string p6=rk.rankprize(15);
system.debug('p 15 is '+ p6);

RankHandler rk1 = new RankHandler();
string p11 = rk1.rankPrizeSwitch(1);
system.debug('p11 is ' + p11);

string p22 = rk1.rankPrizeSwitch(2);
system.debug('p22 is ' + p22);


string p55 = rk1.rankPrizeSwitch(5);
system.debug('p55 is ' + p55);


string p155 = rk1.rankPrizeSwitch(15);
system.debug('p155 is ' + p155);

