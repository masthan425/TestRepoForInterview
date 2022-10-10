public class GenericformController {
      @AuraEnabled 
    public static Map<String , Object> getFieldList(String recordId,List<String> fldSetNameLst,String objectAPI) {
        Map<String,Map<String,List<FieldSetMember>>> fieldSetMap = new Map<String,Map<String,List<FieldSetMember>>>();
        Map<String,Object> fieldSetResultMap = new Map<String,Object>();

        
        Schema.SObjectType objectType = Schema.getGlobalDescribe().get(objectAPI); 
        DescribeSObjectResult sObjdesc = objectType.getDescribe();
        Map<String, Schema.SObjectField> fieldMap = sObjdesc.fields.getMap();
        Map<String, Schema.FieldSet> fsMap =  sObjdesc.fieldSets.getMap();
        List<FieldSetMember> fieldSetLst = new List<FieldSetMember>();
        Set<String> fieldsList = new Set<String>();

        for(String fieldSetName: fldSetNameLst){
            if(fsMap.keySet().contains(fieldSetName.toLowerCase())){
                fieldSetLst = new List<FieldSetMember>();
                List<Schema.FieldSetMember> fieldSetMemberList = fsMap.get(fieldSetName).getFields();
                for(Schema.FieldSetMember fieldSetMemberObj : fieldSetMemberList){
                    Schema.DescribeFieldResult dfr1 = fieldMap.get(fieldSetMemberObj.getFieldPath()).getDescribe();
                    boolean isEdit = dfr1.isUpdateable();
                    if(objectAPI.equalsIgnoreCase('Agreement_Info__c') && !isEdit){
                        isEdit = dfr1.isCreateable();
                    }
                    Integer maxLength = dfr1.getLength();
                    if(fieldSetMemberObj.getType()+''=='INTEGER'){
                        maxLength = dfr1.getDigits();
                    }
                    else if(fieldSetMemberObj.getType()+''=='DOUBLE'){
                        maxLength = dfr1.getPrecision();    
                    }
                    Integer decimalDigits = dfr1.getScale();
                    Boolean isFormula = dfr1.isCalculated();
                    String helpText = dfr1.getInlineHelpText();
                    if(String.valueOf(fieldSetMemberObj.getType()).equalsIgnoreCase('REFERENCE')){
                        String relatedObjNameChild = String.valueOf(dfr1.getReferenceTo()).substringBetween('(',')'); 

                        if(fieldSetMemberObj.getFieldPath().containsIgnoreCase('__c')){
                            fieldsList.add(fieldSetMemberObj.getFieldPath().replace('__c','__r')+'.Name');
                        }
                        else{    
                            fieldsList.add(fieldSetMemberObj.getFieldPath().replace('Id','')+'.Name');
                        }
                        fieldSetLst.add( new FieldSetMember(fieldSetMemberObj , relatedObjNameChild , new String[]{} ,null, false,maxLength, isFormula, !isEdit, decimalDigits, helpText, dfr1.isAccessible()));
                    }
                    else if(fieldSetMemberObj.getType()+'' == 'PICKLIST' || fieldSetMemberObj.getType()+'' == 'MULTIPICKLIST'){
                        fieldSetLst.add( new FieldSetMember(fieldSetMemberObj ,'',getPickListValues(fieldMap , fieldSetMemberObj.getFieldPath()) , null , false,maxLength,isFormula,!isEdit,decimalDigits,helpText, dfr1.isAccessible()));                 
                    }
                    else if(String.valueOf(fieldSetMemberObj.getType()).equalsIgnoreCase('TEXTAREA')){ 
                        Boolean isHtmlFormatted = dfr1.isHtmlFormatted();
                        fieldsList.add(fieldSetMemberObj.getFieldPath());
                        fieldSetLst.add( new FieldSetMember(fieldSetMemberObj , '' , new String[]{} ,null, isHtmlFormatted,maxLength,isFormula,!isEdit,decimalDigits,helpText, dfr1.isAccessible())); 
                    }
                    else{
                        fieldSetLst.add( new FieldSetMember(fieldSetMemberObj , '' , new String[]{} ,null, false,maxLength,isFormula,!isEdit,decimalDigits,helpText, dfr1.isAccessible()));
                        fieldsList.add(fieldSetMemberObj.getFieldPath());                        
                    }   
                }
                if(fieldSetMap.get(fsMap.get(fieldSetName).getLabel()) == null){
                    fieldSetMap.put(fsMap.get(fieldSetName).getLabel() , new Map<String,List<FieldSetMember>>());
                }
                
                fieldSetMap.get(fsMap.get(fieldSetName).getLabel()).put( 'Col1', fieldSetLst);
                
            }
            
        }  
        fieldSetResultMap.put('Result',fieldSetMap);

        if(recordId!=null && recordID!=''){
          String queryString = 'select ';
          for(FieldSetMember fsMember:fieldSetMap.values()[0].get('Col1')){
            queryString += fsMember.fieldPath + ', ';
          }
          queryString = queryString.removeEnd(', ');
          queryString += ' from '+string.escapeSingleQuotes(objectAPI)+' where Id=\''+string.escapeSingleQuotes(recordId)+'\'';
          SObject record = Database.query(queryString);
          if(record!=null){
              fieldSetResultMap.put('Record',record);
          }
              for(FieldSetMember fsMember: fieldSetMap.values()[0].get('Col1')){
                fsMember.value = record.get(fsMember.fieldPath);
              }
        }
        
        return fieldSetResultMap;
    }
     private static List<String>  getPickListValues(Map<String, Schema.SObjectField> fieldMap , String fieldName ){
        List<String> lstPickvals=new List<String>();
        List<Schema.PicklistEntry> pickListValues = fieldMap.get(fieldName).getDescribe().getPickListValues(); //grab the list of picklist values for the passed field on the sobject
        for (Schema.PicklistEntry a : pickListValues) { //for all values in the picklist list
            lstPickvals.add(a.getValue());//add the value  to our final list
        }
        return lstPickvals;
    }
    
 @AuraEnabled
    public static SObject createRecord(SObject record, String objectAPI, string parentObjectId){

            String recordId = '';
           
          
        return null;
    }
}