public class A {

    @InvocableMethod
    public static randomMethod(List<B> inputs){
        for(B obj : inputs){
            System.debug(obj.Name);
        }
    }

    // Inner Wrapper Class to hold collection of multiple data items
    public class B {
        @InvocableVariable(label='Input Name' description='')
        public String Name;
        @InvocableVariable(label='Input Class' description='')
        public Integer ClassId;
        @InvocableVariable(label='Input Roll No' description='')
        public Integer RollNum;
    }
}