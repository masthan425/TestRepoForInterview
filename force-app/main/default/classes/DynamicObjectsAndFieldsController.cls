public class DynamicObjectsAndFieldsController{
     
    Public string selectedObj {get;set;}
    public String selectedField {get; set;}
    public List<SObject> records {get; set;}
    public String Title {get; set;}
    //Public map<string,list<SObject>> dynmap {get; set;}

                    
    Public DynamicObjectsAndFieldsController(){
         records = new List<SObject>();
        // dynmap = new map<string,list<SObject>>(); 
         Title = 'Select and Click the button to find duplicate records';
      }
      
    Public List<Selectoption> getObjList(){
        List<Schema.SObjectType> objList = Schema.getGlobalDescribe().Values();     
        List<SelectOption> objNames = new List<SelectOption>();
        objNames.add(new SelectOption('','-- Select --'));
        for(Schema.SObjectType obj : objList)
        {
            objNames.add(new SelectOption(obj.getDescribe().getName(),obj.getDescribe().getLabel()));
        }
        objNames.sort();
        return objNames;
    }
     
    public List<SelectOption> getObjectFields() {
        List<SelectOption> fieldNames = new List<SelectOption>();
        fieldNames.add(new SelectOption('','-- Select --'));
        if(!String.isBlank(selectedObj)){
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Schema.SObjectType ObjSchema = schemaMap.get(selectedObj);
            Map<String, Schema.SObjectField> fieldMap = ObjSchema.getDescribe().fields.getMap();
            for (String fieldName: fieldMap.keySet()) 
            {  
                fieldNames.add(new SelectOption(fieldName, fieldMap.get(fieldName).getDescribe().getLabel()));
            }
        }
        return fieldNames;
    }  
    
    public void queryMe(){
            Title = 'Duplicates';
             if(string.isNotBlank(selectedObj)){
             // for all records
              // records = database.query('select '+selectedField+' from '+selectedObj +' where '+selectedField+' != NULL'+' order by '+selectedField );             
              string query = 'select '+selectedField + ' sf, count(id) cont from '+selectedObj +' where '+selectedField+' != NULL'+' GROUP BY '+selectedField + ' having count(Id)>1';
              system.debug(query);
              AggregateResult[] groupedResults= database.query(query); 
                   set<String> sfs =new set<String>();
                for (AggregateResult ar : groupedResults) {                     
                     sfs.add(String.valueof(ar.get('sf')));                 
                }
             records = database.query('select id, '+selectedField +' from '+selectedObj +' where '+selectedField+' != NULL'+' AND '+selectedField +' =:sfs order by '+selectedField);  
               }
              system.debug('records '+records.size());
              
              if(records.size() == 0){
              system.debug('records2 '+records.size());
              ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.INFO, 'No Records Found');
                ApexPages.addMessage(msg);
              }
              
          /* if(records.size() > 0) { 
           for(SObject r: records){ 
            If(!dynmap.keyset().contains((string)r.get(selectedField))){
             dynmap.put((string)r.get(selectedField),new list<SObject>{});
              }
             dynmap.get((string)r.get(selectedField)).add(r);
            }
           } */   
        }    
}