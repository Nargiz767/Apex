/**
 * SOAP (Simple Object Access Protocol) - Earlier framework of doing Web Communication/Integration, Secure way of data transfering, XML Messaging Format only
 * Outbound Callout using SOAP Api - 4 Steps of Implementation
 * Step 1: Create Remote Site Setting - to whitelist Domain
 * Step 2: WSDL (Web Service Description Language) - Get WSDL from External System
 *  a. Endpoint Url, Features available, Input parameters (Request), Reponse - XML format
 * Step 3: Convert WSDL to Apex Class using Salesforce framework
 *  a. Useful information to extract from APex Class -
 *      i. Identify Inner Class - ImplementationPort
 *      ii. Endpoint
 *      iii. Features available - (Methods/Functiones defined in Inner Class)
 *      iv. Utilise any Feature - Understand Datatype for Input Paramets and Output Parameters
 * Step 4: Use/Consume/Invoke the Soap Apex Class to make callout
 */

public with sharing class SoapApiCallOut {
    /**
     * SOAP API callout to calculator heroku app to do multiplicatian /step.4

     */
    public static Double makeMultiplication(){
       // Create Instance of INNER CLASS of WSDL APex
        // All features of SOAP are non-static methods
        CalculatorSOAPApex.CalculatorImplPort calc = new CalculatorSOAPApex.CalculatorImplPort();
        // Preparing Request parameters
        Double num1 = 8.0;
        Double num2 = 2.0;
        // Sending SOAP Api callout to Calcultor Heroku App
        // Fetching Response
        Double result = calc.doMultiply(num1, num2);
        System.debug('Calculator Request Parameters for Multiply Feature is : '+ num1 + ' * ' + num2);
        System.debug('Calculator Response for Multiply Feature is : '+ result);
        return result;
    }

    public static Double makeDivide(){
        CalculatorSOAPApex.CalculatorImplPort div = new CalculatorSOAPApex.CalculatorImplPort();
        Double num1= 14.0;
        Double num2= 7.0;
      Double result = div.doDivide(num1,num2);
      System.debug('Calculator Request Parameters for divide Feature is : '+ num1 + ' * ' + num2);
      System.debug('Calculator Response for divide Feature is : '+ result);
      return result;
    }

 public static Double makeSubtract(){
    CalculatorSOAPApex.CalculatorImplPort sub = new CalculatorSOAPApex.CalculatorImplPort();
    Double num1 = 14.0;
    Double num2= 7.0;
    Double result= sub.doSubtract(num1,num2);
    System.debug('Calculator Request Parameters for subtract Feature is : '+ num1 + ' * ' + num2);
    System.debug('Calculator Response for subtract Feature is : '+ result);
    return result;
  }
  public static Double makeAdd(){
    CalculatorSOAPApex.CalculatorImplPort ad= new CalculatorSOAPApex.CalculatorImplPort();
    Double num1= 14.0;
    Double num2=7.0;
    Double result = ad.doAdd(num1,num2);
    System.debug('Calculator Request Parameters for addtion Feature is : '+ num1 + ' * ' + num2);
    System.debug('Calculator Response for addtion Feature is : '+ result);
    return result;
  }
 
  

    /**
     * SOAP API call Out to park heroku app to get list of park names based on country 
     */

    public static list<string> makePrakCallOut(){
        ParkSOAPApex.ParksImplPort park= new  ParkSOAPApex.ParksImplPort();
        string inputCountry ='India';
        list<string> parkNames= park.byCountry(inputCountry);
        system.debug ('Park SOAP API Resposponse for countrt -wise Feature is:'+ parkNames);
        return parkNames;
        

    }
}