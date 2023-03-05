// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents


//step we have to prepare inputs variables with values map
// Invoke Auto Launched Flow from APex
// Step 1: We have to prepare Input Variables along with values - Map
Map<String, Object> inputs = new Map<String, Object>();
inputs.put('ownerId', '005Do00000125uUIAQ');
inputs.put('recordId', '001Do000003CNwvIAG');
// Step 2: Invoking Flow using Flow.Interview Apex Class
// Flow.Interview is a predefined Apex Class which hold relationship between Apex & Flows
Flow.Interview autoLaunchFlow = Flow.Interview.createInterview('Auto_Launched_Flow_Demo', inputs);
autoLaunchFlow.start();

RestApiOutboundCallout.getAnimals();
RestApiOutboundCallout.getUser();
 SoapApiCallOut.makeMultiplication();
  SoapApiCallOut.makePrakCallOut();
   SoapApiCallOut.makeDivide();
    SoapApiCallOut.makeSubtract();
    SoapApiCallOut.makeAdd();
    RestInboundwebServices.createcase('test','hello','New','High','Web');
