@isTest
public class StringConcateDemoTest {
    @isTest
   private static void testConcate(){
    string r = StringConcatedemo.concateUpperCase('test','method1');
    system.debug(r);
    system.assert(r== 'TEST,METHOD1');
    system.assertEquals('TEST,METHOD1', r);
   }
}       
