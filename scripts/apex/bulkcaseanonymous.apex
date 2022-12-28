list <case> listCase = new list <case>();
for (integer i= 0; i<205; i++) {
    case c = new case ()
    c.subject = 'there is a bug';
    c.description = 'resolve it';
    c.status = 'new';
    c.origin = 'web';
    listcase.add(c);
}
insert listcase;

//Example:
// 50 account records are inserted.
    // suspiciously duplicate (name) record.
//350 account records
    //trigger will run two times.
    //trigger.new will be populated two times.

list<case> getCases = [select id, status from case where status = 'New'];
for (case eachCase : getCases) {
    eachCase.Status = 'Working';
}
update getCases;


