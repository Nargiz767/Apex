@istest
public with sharing class TurkishSOAPCallOutTEST {
        @IsTest
        static void parksCalloutTest(){
            TurkishParksServicesMOCK mock = new TurkishParksServicesMOCK();
            test.setMock(WebServiceMock.class, mock);
    
            string country = 'Turkey';
            string[] parks = TurkishSoapCallOut.parksCallout(country);
    
            system.assertEquals(2, parks.size());
    
        }
    }
