public class fetchContactsbyLeadEmailController {
   
 @AuraEnabled
   public static List <contact> fetchContactsbyLeadEmail(id leadId) {
      
      string leadEmail = [SELECT Id, email FROM lead where id =:leadId].email;
      
      return [SELECT Id, NAME,Owner.Name,Email,Phone FROM contact where email =:leadEmail];
     }     
}