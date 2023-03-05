public with sharing class TurkishGEtPRAC {
  public static void getTodos() {
    Http httpObject = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://jsonplaceholder.typicode.com/todos');
    request.setMethod('GET');
    HttpResponse response = httpObject.send(request);
    String responseBody = response.getBody();
    if(response.getStatusCode()==200){
        system.debug('get todos=>'+ responseBody);
    }
  }

  public static void postTodos() {
    Http httpObject = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://jsonplaceholder.typicode.com/todos');
    request.setMethod('POST');
    request.setHeader('Contect-Type','Application/json');
    request.setBody('{"userId": 4,"title":"post Item","completed":false}');

    HttpResponse response = httpObject.send(request);
    String responseBody = response.getBody();
    if (response.getStatusCode() == 201) {
        System.debug('post data => ' + responseBody);
        System.debug('isleminiz basarili oldu..');
    }
}
}