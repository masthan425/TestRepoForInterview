public class DynamicTableController {

    
     @AuraEnabled
    public static wrapper fetchAccounts(){
        wrapper test = new wrapper([Select Id,Name,AccountNumber,Phone FROM Account],new List<String>{'Name','AccountNumber','Phone'});
      /*  test.accountList = [Select Id,Name,AccountNumber,Phone FROM Account];
        system.debug('test'+test.accountList);
        test.fieldsList.add('Name');
        test.fieldsList.add('AccountNumber');
        test.fieldsList.add('Phone'); */
        return test;
    }
    public class wrapper{
         @AuraEnabled
       public List<Account> accountList;
         @AuraEnabled
        public List<String> fieldsList; 
        public wrapper(List<Account> accountList,List<String> fieldsList){
            this.accountList = accountList;
            this.fieldsList = fieldsList;
        }
    }
     @AuraEnabled
	public static String getFieldSet(String sObjectName, String fieldSetName) {
        String result = '';
        try{
            SObjectType objToken = Schema.getGlobalDescribe().get(sObjectName);
            Schema.DescribeSObjectResult d = objToken.getDescribe();
            Map<String, Schema.FieldSet> FsMap = d.fieldSets.getMap();
            system.debug('>>>>>>> FsMap >>> ' + FsMap);
            if(FsMap.containsKey(fieldSetName))
                for(Schema.FieldSetMember f : FsMap.get(fieldSetName).getFields()) {
                    if(result != ''){
                        result += ',';
                    }
                    String jsonPart = '{';
                    jsonPart += '"label":"' + f.getLabel() + '",';
                    jsonPart += '"required":"' + (f.getDBRequired() || f.getRequired()) + '",';
                    jsonPart += '"type":"' + (f.getType()) + '",';
                    jsonPart += '"name":"' + f.getFieldPath() + '"';
                    jsonPart += '}';
                    result += jsonPart;
            }
        }
        catch(Exception e){
            result += e.getLineNumber() + ' : ' + e.getMessage();
        }
        return '['+result+']';
    }

    @AuraEnabled
    public static String getRecords(String sObjectName, String parentFieldName, String parentRecordId, String fieldNameJson){

        List<sObject> lstResult = new List<sObject>();
        String result = '[]';
        try{
            List<String> fieldNames = (List<String>) JSON.deserialize(fieldNameJson, List<String>.class);
            Set<String> setFieldNames = new Set<String>();
            String query = 'SELECT ' + String.join(fieldNames, ',') + ' FROM ' + sObjectName;
            if(parentFieldName != NULL && parentFieldName != '' && parentRecordId != NULL){
                query += ' WHERE ' + parentFieldName + '= \'' +  parentRecordId + '\'';
            }
            for(sObject s : Database.query(query)){
                lstResult.add(s);
            }
            if(lstResult.size() > 0) {
                result = JSON.serialize(lstResult);
            }
        }
        catch(Exception e){
            result += e.getLineNumber() + ' : ' + e.getMessage();
        }
        return result;
    }
}