public  class RankHandler {
    public string rankPrize(integer rank) {
string  prize='';
if(rank==1){
    prize='gold';
} else if(rank==2){
    prize='silver';
}else if (rank==3) {
    prize='bronze';
} else {
    if (rank <=10){
        prize='top 10 certif';
    } else {
        prize='participation certificate';
    }
}
return prize;
    }

    public string rankPrizeSwitch(integer rank){
        string prize='';
switch on rank{
    when 1{
        prize='gold';
    }
    when 2{
        prize='silver';
    }
    when 3{
        prize='bronze';
    }
    when 4,5,6,7,8,9,10{
        prize='top 10 congrats';
    }

    when else {
        prize='thank you for participation';
    }
}
        return prize;
    }
}
