@isTest
public class GetFlagCallOutTURKISHTEST {
    @isTest
    private static void  getcountryTest() {
      //1. bir mock create edirik
      GetFlagCountryMock_Turkish mock= new GetFlagCountryMock_Turkish();
      Test.setMock(HttpCalloutMock.class,mock);

      // 2. metodu cagirma test 
      HttpResponse response = FlagsCountryTURKISH.getCountry(); 


      // 3. assert kontrolu 
           //3. asserts kontrolleri..
           system.assertEquals(200, response.getStatusCode());
           System.assertEquals('OK', response.getStatus());

    }
}