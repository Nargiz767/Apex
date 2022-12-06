
    public  class turkishclass {
        public static void degreeofcities(Map<string, List<Double>> cityOfHot){
            system.debug(cityOfHot);
            System.debug('Newyork son 1 haftalik sicaklik degerleri = '+ cityOfHot.get('newYork'));

            for (string city : cityOfHot2.keySet()) {
                System.debug(city + ' sehrinin son 1 haftalik sicaklik degerleri = '+ cityOfHot.get(city) );
            }
        /*Map<string, List<Double>> cityOfHot = new Map<string, List<Double>>();
        List<Double> istanbulOfHot = new List<Double>{11.5, 17.4, 21.3, 15.5, 8.7, 22.2, 23.3};
        cityOfHot.put('istanbul', istanbulOfHot);

        List<Double> newYorkOfHot = new List<Double>{1.5, 7.4, 11.3, 10.5, 8.2, 2.2, 3.3};
        cityOfHot.put('newYork', newYorkOfHot);

        List<Double> torontoOfHot = new List<Double>{-1.5, -7.2, -11.3, -5.5, -3.7, -2.2, -3.3};
        cityOfHot.put('toronto', torontoOfHot);

        List<Double> nairobiOfHot = new List<Double>{21.5, 37.4, 31.3, 25.5, 28.7, 22.2, 33.3};
        cityOfHot.put('nairobi', nairobiOfHot);

        List<Double> amsterdamOfHot = new List<Double>{7.5, 6.4, 1.3, 15.5, 8.7, 2.2, 2.3};
        cityOfHot.put('amsterdam', amsterdamOfHot);
      */  

        }

        public static void averageDegreeOfCities(Map<string, List<Double>> cityOfHot3) {
            Map<String,Double> averageHot = new  Map<String,Double>();
            for (string city : cityOfHot3.keySet()) {
                System.debug(city + ' icin son 1 haftanin sicaklik degerleri = ' + cityOfHot3.get(city));
                Double sum = 0;
                for (double eachDegree : cityOfHot3.get(city)) {
                    sum += eachDegree;
                }
                double ort = sum/cityOfHot3.get(city).size();
                averageHot.put(city, ort);
            }
            System.debug('sehirler ve 1 haftalik sicaklik ortalamalari = ' + averageHot);
        }
    
    }

