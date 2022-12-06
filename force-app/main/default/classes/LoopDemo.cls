public  class LoopDemo {
  public void prinr_int_while(){
    integer count= 1;
    while (count <= 25){
        system.debug(count);  
        count++;
     
    }
  }

  public void print_n_numbers(integer n){
    for (Integer i = 0; i < n; i++) {
      system.debug(i);
    }
  }

  public void print_odd_number (integer starti,integer endi){
    for (integer i= starti; i<endi; i++){
      integer remainder=math.mod(i,2);
      // mod1==1 then, odd number 
        if (remainder==1){
          system.debug(i+ 'is odd');
        }
      
    }
  }
    }

