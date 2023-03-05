public with sharing class TurkishSoapCallOut {
    public static String[] parksCallout(string country) {
        ParksServices.ParksImplPort parksService = new ParksServices.ParksImplPort();
        string[] parks = parksService.byCountry(country);
        System.debug(country + ' ulkesinin parklari => ' + parks);
        return parks;
    }
}






