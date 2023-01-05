account acc1=new account();
acc1.name = 'siTerst';
acc1.industry ='Energy';

account acc2 = new account();
acc2.Name= 'Ui test';
acc2.industry ='energy';


account acc3 = new account();
account acc4 = new account();

list <account> listacc = new list <account>{acc1,acc2,acc3,acc4};

list <database.SaveResult> results= database.insert(listacc,false);

for (database.SaveResult r: results){
    if(r.isSuccess()){
        system.debug('insert succesfully'+ r.getId());
    } else{
  system.debug('eroor out'+r.getErrors());
    }
}




