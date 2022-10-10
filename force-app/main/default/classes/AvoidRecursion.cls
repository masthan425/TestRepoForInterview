public Class AvoidRecursion{
    private static boolean firstRun = true;
    private static boolean afterRun = true;
    private static boolean afterInsertRun = true;
    private static boolean afterUpdateRun = true;
    private static boolean beforeUpdateRun = true;
    
    public static boolean isFirstRun(){
        if(firstRun){
          firstRun = false;
          return true;
        }else{
            return firstRun;
        }
    }
    
    public static boolean isAfterRun(){
        if(afterRun){
          afterRun = false;
          return true;
        }else{
            return AfterRun;
        }
    }
    
    public static boolean isAfterInsertRun(){
        if(afterInsertRun ){
          afterInsertRun = false;
          return true;
        }else{
            return afterInsertRun ;
        }
    }
    
    public static boolean isAfterUpdateRun(){
        if(afterUpdateRun ){
          afterUpdateRun = false;
          return true;
        }else{
            return afterUpdateRun ;
        }
    }
    
    public static boolean isBeforeUpdateRun (){
        if(beforeUpdateRun ){
          beforeUpdateRun = false;
          return true;
        }else{
            return beforeUpdateRun ;
        }
    }
    
}