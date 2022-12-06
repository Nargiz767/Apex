Candidates.CompanyName='softInnovas';
Candidates.printCandidateinfo();
system.debug('start count of candidates ='+Candidates.countcandidates);

Candidates c1=new Candidates();
c1.Name='Jerry';
c1.Gender='Male';
c1.printcandidate();

Candidates c2=new Candidates();

c2.Name='George';
c2.Gender='Male';
c2.printcandidate();

Candidates.CompanyName='Vandeley';

Candidates c3=new Candidates();

c3.Name='Nargiz';
c3.Gender='Female';
c3.printcandidate();

system.debug('---------');
c1.printcandidate();
system.debug('---------');
c2.printcandidate();
Candidates.printCandidateinfo();


Candidates c4 = new Candidates();
c4.Name = 'Kramer';
c4.Gender = 'Male';
c4.printCandidate();
system.debug('END count of candidates = ' + Candidates.countCandidates);
