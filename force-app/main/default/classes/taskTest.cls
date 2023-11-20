@isTest
public class taskTest{
    @isTest
    private static void  getcountryTest() {
      //1. bir mock create edirik
      taskTest_Mock mock= new taskTest_Mock();
      Test.setMock(HttpCalloutMock.class,mock);

      // 2. metodu cagirma test 
      HttpResponse response = taskApi.getTask(); 


      // 3. assert kontrolu 
           //3. asserts kontrolleri..
           system.assertEquals(200, response.getStatusCode());
           System.assertEquals('OK', response.getStatus());

    }
}