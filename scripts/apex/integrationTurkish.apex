List<account> accList = new List<account>();
Account acc1=new Account();
acc1.name=  'Integtration test 1';
acc1.AnnualRevenue=100000;
accList.add(acc1);

Account acc2=new Account();
acc2.name=  'Integtration test 2';
acc2.AnnualRevenue=200000;
accList.add(acc2);

system.debug(accList);
string accountJson = JSON.serialize(accList);
system.debug('listin Json formati'+accountJson);


List<account> acclistnew = (list<account>)Json.deserialize(accountJson,list<account>.class);
system.debug ('newlist'+acclistnew);


// amount 10000 den boyuk bir dene recordu alib Json formatina salmaq

Opportunity opp = [SELECT id ,name ,  stageName FROM Opportunity WHERE amount>10000 LIMIT 1];
string oppJson = JSON.serialize(opp);
system.debug(oppJson);

// Case OBJ Contactlara bagli olan 2 dene case recordu .Casenumber, subject,description,contact.firstName,Contact.lastname,account.name bilgileri ile baraber gelsin ve jSon formati olsun;
List <case> cslist=[SELECT id,caseNumber,subject,description,contact.firstName,Contact.lastName,Account.name
                    FROM Case limit2];

string caseJson = JSON.serialize(cslist);
system.debug(caseJson);


string jsonAcc ='{"Name":"JSONToApex","Type":"Prospect","AnnualRevenue":500}';
Account acc3=(account)JSON.deserialize(jsonAcc,Account.class);
insert acc3;
system.debug (acc3);