public class Candidates {
   public string Name;
   public string Gender;
   public static string CompanyName;
   public static integer countcandidates=0;

  public Candidates (){
   countcandidates++;
  }

  
   public void printCandidate(){
      system.debug('Name is ' + Name);
      system.debug('gender is ' + Gender);
      system.debug('company name is ' + CompanyName);
  }

   
   public static void printCandidateinfo(){
    //system.debug('name is '+Name);
    // we can access only static memebers inside static method 
    system.debug('company name is '+CompanyName);
    // we cannot access non- static memebers inside static method 
    // system.debug('name is '+Name );
   }
}
