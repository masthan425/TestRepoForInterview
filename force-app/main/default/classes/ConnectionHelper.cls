public class ConnectionHelper {
    public static Id getConnectionId(String connectionName) {   
        List<PartnerNetworkConnection> ConnectionList = [Select id from PartnerNetworkConnection where connectionStatus = 'Accepted' and connectionName = :connectionName];
        if ( ConnectionList.size() != 0 ) {
            return ConnectionList.get(0).Id;
        }
        return null;
    }
    public static Id getConnectionOwnerId(String connectionName) {
        List<PartnerNetworkConnection> ConnectionList = [Select createdById from PartnerNetworkConnection where connectionStatus = 'Accepted' and connectionName = :connectionName];
        if ( ConnectionList.size() != 0 ) {
            return ConnectionList.get(0).createdById;
        }
        return null;
    }
    
    
    public static void publishRecords(List<Id> recordsToPublish, Id networkId){       //ConnectionHelper.publishRecords(new List<Id>{''}, '04P6F000000Cj04UAC'); 
        
        List<PartnerNetworkRecordConnection> connectionsList =  new  List<PartnerNetworkRecordConnection>();        
        for (Id recordId : recordsToPublish) {                     
            PartnerNetworkRecordConnection newConnection = new PartnerNetworkRecordConnection(ConnectionId = networkId, 
                                                                                              LocalRecordId = recordId,
                                                                                              SendClosedTasks = false, 
                                                                                              SendOpenTasks = false,
                                                                                              SendEmails = false);
            connectionsList.add(newConnection);  
        }
        if (connectionsList.size() > 0) { 
            database.insert(connectionsList); 
        }
        
    }
}