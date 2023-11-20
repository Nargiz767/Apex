public class TaskApiWrapper {
    
    public class Languages {
        public String iso639_1 {get;set;}
        public String iso639_2 {get;set;}
        public String name {get;set;}
        public String nativeName {get;set;}
        
        public Languages(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'iso639_1') {
                            iso639_1 = parser.getText();
                        } else if (text == 'iso639_2') {
                            iso639_2 = parser.getText();
                        } else if (text == 'name') {
                            name = parser.getText();
                        } else if (text == 'nativeName') {
                            nativeName = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Languages consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Translations {
        public String br {get;set;}
        public String de {get;set;}
        public String es {get;set;}
        public String fa {get;set;}
        public String fr {get;set;}
        public String hr {get;set;}
        public String it {get;set;}
        public String ja {get;set;}
        public String nl {get;set;}
        public String pt {get;set;}
        
        public Translations(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'br') {
                            br = parser.getText();
                        } else if (text == 'de') {
                            de = parser.getText();
                        } else if (text == 'es') {
                            es = parser.getText();
                        } else if (text == 'fa') {
                            fa = parser.getText();
                        } else if (text == 'fr') {
                            fr = parser.getText();
                        } else if (text == 'hr') {
                            hr = parser.getText();
                        } else if (text == 'it') {
                            it = parser.getText();
                        } else if (text == 'ja') {
                            ja = parser.getText();
                        } else if (text == 'nl') {
                            nl = parser.getText();
                        } else if (text == 'pt') {
                            pt = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Translations consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class RegionalBlocs {
        public String acronym {get;set;}
        public String name {get;set;}
        
        public RegionalBlocs(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'acronym') {
                            acronym = parser.getText();
                        } else if (text == 'name') {
                            name = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'RegionalBlocs consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public String name {get;set;}
    public List<String> topLevelDomain {get;set;}
    public String alpha2Code {get;set;}
    public String alpha3Code {get;set;}
    public List<String> callingCodes {get;set;}
    public String capital {get;set;}
    public List<String> altSpellings {get;set;}
    public String region {get;set;}
    public String subregion {get;set;}
    public Integer population {get;set;}
    public List<Integer> latlng {get;set;}
    public String demonym {get;set;}
    public Integer area {get;set;}
    public Double gini {get;set;}
    public List<String> timezones {get;set;}
    public List<String> borders {get;set;}
    public String nativeName {get;set;}
    public String numericCode {get;set;}
    public List<Currencies> currencies {get;set;}
    public List<Languages> languages {get;set;}
    public Translations translations {get;set;}
    public String flag {get;set;}
    public List<RegionalBlocs> regionalBlocs {get;set;}
    public String cioc {get;set;}
    
    public TaskApiWrapper(JSONParser parser) {
        while (parser.nextToken() != System.JSONToken.END_OBJECT) {
            if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                String text = parser.getText();
                if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                    if (text == 'name') {
                        name = parser.getText();
                    } else if (text == 'topLevelDomain') {
                        topLevelDomain = arrayOfString(parser);
                    } else if (text == 'alpha2Code') {
                        alpha2Code = parser.getText();
                    } else if (text == 'alpha3Code') {
                        alpha3Code = parser.getText();
                    } else if (text == 'callingCodes') {
                        callingCodes = arrayOfString(parser);
                    } else if (text == 'capital') {
                        capital = parser.getText();
                    } else if (text == 'altSpellings') {
                        altSpellings = arrayOfString(parser);
                    } else if (text == 'region') {
                        region = parser.getText();
                    } else if (text == 'subregion') {
                        subregion = parser.getText();
                    } else if (text == 'population') {
                        population = parser.getIntegerValue();
                    } else if (text == 'latlng') {
                        latlng = arrayOfInteger(parser);
                    } else if (text == 'demonym') {
                        demonym = parser.getText();
                    } else if (text == 'area') {
                        area = parser.getIntegerValue();
                    } else if (text == 'gini') {
                        gini = parser.getDoubleValue();
                    } else if (text == 'timezones') {
                        timezones = arrayOfString(parser);
                    } else if (text == 'borders') {
                        borders = arrayOfString(parser);
                    } else if (text == 'nativeName') {
                        nativeName = parser.getText();
                    } else if (text == 'numericCode') {
                        numericCode = parser.getText();
                    } else if (text == 'currencies') {
                        currencies = arrayOfCurrencies(parser);
                    } else if (text == 'languages') {
                        languages = arrayOfLanguages(parser);
                    } else if (text == 'translations') {
                        translations = new Translations(parser);
                    } else if (text == 'flag') {
                        flag = parser.getText();
                    } else if (text == 'regionalBlocs') {
                        regionalBlocs = arrayOfRegionalBlocs(parser);
                    } else if (text == 'cioc') {
                        cioc = parser.getText();
                    } else {
                        System.debug(LoggingLevel.WARN, 'TaskApiWrapper consuming unrecognized property: '+text);
                        consumeObject(parser);
                    }
                }
            }
        }
    }
    
    public class Currencies {
        public String code {get;set;}
        public String name {get;set;}
        public String symbol {get;set;}
        
        public Currencies(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'code') {
                            code = parser.getText();
                        } else if (text == 'name') {
                            name = parser.getText();
                        } else if (text == 'symbol') {
                            symbol = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Currencies consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    
    public static List<TaskApiWrapper> parse(String json) {
        System.JSONParser parser = System.JSON.createParser(json);
        return arrayOfTaskApiWrapper(parser);
    }
    
    public static void consumeObject(System.JSONParser parser) {
        Integer depth = 0;
        do {
            System.JSONToken curr = parser.getCurrentToken();
            if (curr == System.JSONToken.START_OBJECT ||
                curr == System.JSONToken.START_ARRAY) {
                    depth++;
                } else if (curr == System.JSONToken.END_OBJECT ||
                           curr == System.JSONToken.END_ARRAY) {
                               depth--;
                           }
        } while (depth > 0 && parser.nextToken() != null);
    }
    
    
    private static List<TaskApiWrapper> arrayOfTaskApiWrapper(System.JSONParser p) {
        List<TaskApiWrapper> res = new List<TaskApiWrapper>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new TaskApiWrapper(p));
        }
        return res;
    }
    
    
    private static List<String> arrayOfString(System.JSONParser p) {
        List<String> res = new List<String>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(p.getText());
        }
        return res;
    }
    
    
    
    
    private static List<Integer> arrayOfInteger(System.JSONParser p) {
        List<Integer> res = new List<Integer>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(p.getIntegerValue());
        }
        return res;
    }
    
    
    
    
    private static List<RegionalBlocs> arrayOfRegionalBlocs(System.JSONParser p) {
        List<RegionalBlocs> res = new List<RegionalBlocs>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new RegionalBlocs(p));
        }
        return res;
    }
    
    
    
    
    private static List<Currencies> arrayOfCurrencies(System.JSONParser p) {
        List<Currencies> res = new List<Currencies>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Currencies(p));
        }
        return res;
    }
    
    
    
    private static List<Languages> arrayOfLanguages(System.JSONParser p) {
        List<Languages> res = new List<Languages>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Languages(p));
        }
        return res;
    }
    
    
}