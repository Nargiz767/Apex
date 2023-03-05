@RestResource(urlMapping='/Opp/*')
global with sharing class Opprtunitymanager_turkisPrac {
    @HttpGet
 global static id getOpportunity(){
    RestRequest Request =RestContext.request;
    string uri= request.requestURI;
    id oppId= uri.substringAfterLast('/');
    Opportunity op=[SELECT id,name, closedate, stagename,amount FROM Opportunity where id=:oppId];
    return op.id;
 }
@HttpPost
global static id createOpportunity(string name, string closedate,string stagename, string amount){
    opportunity opp= new Opportunity();
    opp.Name= name;
    opp.Closedate=date.valueOf(closedate);
    opp.Stagename= stagename;
    opp.amount=Decimal.valueOf(amount);
    insert opp;
    return opp.id;
}

@HttpDelete
global static string deleteOpportunity(){
    RestRequest request= RestContext.request;
    string uri= request.requestURI;
    id oppId= uri.substringAfterLast('/');
    opportunity op=[select id from opportunity where id=:oppId];
    delete op;
    return 'record silindi';
}

@HttpPut
global static id upsertOpportunity(string id, string name, string closeDate, string stageName, string amount) {
    Opportunity opp = new Opportunity();
    opp.id = id;
    opp.Name = name;
    opp.CloseDate = Date.valueOf(closeDate);
    opp.StageName = stageName;
    opp.Amount = Decimal.valueOf(amount);
    upsert opp;
    return opp.id;
}

@HttpPatch
global static Opportunity updateOpportunity() {
    RestRequest Request = RestContext.Request;
    string jsonString = Request.requestBody.toString();
    Opportunity op = (Opportunity)JSON.deserialize(jsonString, Opportunity.Class);
    update op;
    Opportunity opNew = [select id, name, stageName, closeDate, amount from Opportunity where id =:op.id];
    return opNew;

}


}