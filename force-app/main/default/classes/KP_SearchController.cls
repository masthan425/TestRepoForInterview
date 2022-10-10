public class KP_SearchController {
    
    @AuraEnabled
    public static Map<String,List<Map<String,String>>> fetchPickListValues(String pickListValues) {
        Map<String,List<Map<String,String>>> returnMap = new Map<String,List<Map<String,String>>>();
        List<Map<String,String>> recordTypeList = new List<Map<String,String>>();
        for(String pickListValue : pickListValues.split(',')){
            recordTypeList.clear();
            recordTypeList.add(new Map<String,String>{'label' => '~1 sample','value' => '~1 sample', 'order'=> 'a'});
            recordTypeList.add(new Map<String,String>{'label' => '~11 sample','value' => '~11 sample', 'order'=> 'c'});
            recordTypeList.add(new Map<String,String>{'label' => '~2 sample','value' => '~2 sample', 'order'=> 'b'});
            recordTypeList.add(new Map<String,String>{'label' => '~3 sample','value' => '~3 sample', 'order'=> 'd'});
            recordTypeList.add(new Map<String,String>{'label' => '~4 sample','value' => '~4 sample', 'order'=> 'e'});
            recordTypeList.add(new Map<String,String>{'label' => '~5 sample','value' => '~5 sample', 'order'=> 'f'});
            recordTypeList.add(new Map<String,String>{'label' => '~12 sample','value' => '~12 sample', 'order'=> 'g'});
            recordTypeList.add(new Map<String,String>{'label' => '~21 sample','value' => '~21 sample', 'order'=> 'h'});
            recordTypeList.add(new Map<String,String>{'label' => 'A9','value' => 'A9', 'order'=> 'i'});
            recordTypeList.add(new Map<String,String>{'label' => 'A10','value' => 'A10', 'order'=> 'j'});
            recordTypeList.add(new Map<String,String>{'label' => '~1-4 sample','value' => '~1-4 sample', 'order'=> 'k'});
            recordTypeList.add(new Map<String,String>{'label' => '~1-2 sample','value' => '~1-2 sample', 'order'=> 'l'});
            recordTypeList.add(new Map<String,String>{'label' => 'A12','value' => 'A12', 'order'=> 'm'});
            recordTypeList.add(new Map<String,String>{'label' => 'abc','value' => 'abc', 'order'=> 'n'});
            recordTypeList.add(new Map<String,String>{'label' => 'test','value' => 'test', 'order'=> 'o'});
            recordTypeList.add(new Map<String,String>{'label' => 'sample','value' => 'sample', 'order'=> 'p'});
            recordTypeList.add(new Map<String,String>{'label' => 'ram','value' => 'ram', 'order'=> 'q'});
            recordTypeList.add(new Map<String,String>{'label' => 'sam','value' => 'sam', 'order'=> 'r'});
            returnMap.put(pickListValue,recordTypeList);
        }
        return returnMap;
    }
    @AuraEnabled
    public static List<User> getSearchResults(String searchKeyword, List<String> availabilityFilter, List<String> hourFilter, List<String> locationfilter) {
        string query ='SELECT Id, Name, Title, Skills__c, My_Weekly_Availability__c, My_Availability_Duration__c, Locations__c, SmallPhotoUrl, FullPhotoUrl FROM User ';
        String whereCondition = '';
        
        if(searchKeyword != null && searchKeyword != ''){
            whereCondition += ' (Name LIKE \'%'+searchKeyword+'%\' OR Title LIKE \'%'+searchKeyword+'%\')  AND ';
        }
        if(availabilityFilter != null && availabilityFilter.size() > 0){
            whereCondition += ' My_Weekly_Availability__c IN  :availabilityFilter AND ';
        }
        
        if(hourFilter != null && hourFilter.size() > 0){
            whereCondition += ' My_Availability_Duration__c IN  :hourFilter AND ';
        }
        
        if(locationfilter != null && locationfilter.size() > 0){
            whereCondition += ' Locations__c IN  :locationfilter AND ';
        }  
        if(whereCondition != ''){
            query += 'WHERE '+whereCondition.removeEnd('AND ') +' LIMIT 500';
        }
        system.debug(query);
        return  Database.query(query); //[SELECT Id, Name, Title, Skills__c, SmallPhotoUrl, FullPhotoUrl FROM User];
    }
}