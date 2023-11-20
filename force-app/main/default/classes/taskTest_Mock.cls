public  class taskTest_Mock implements HttpCalloutMock {
    public HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setStatus('OK');
        response.setHeader('Content-Type', 'application/json');
        response.setBody('[{"name":"Test Country","capital":"Test Capital","flags":{"svg":"Test SVG"},"nativeName":"Test Native Name","population":1000,"region":"Test Region"}]');

        return response;
    }
}