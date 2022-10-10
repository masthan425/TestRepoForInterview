public class PackageXML {
        public String type = 'Package_x';
        public String fullName;
        private String[] fullNameTypeInfo = new String[]{'fullName',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
        public String apiAccessLevel;
        public String description;
        public String namespacePrefix;
        public ProfileObjectPermissions[] objectPermissions;
        public String packageType;
        public String postInstallClass;
        public String setupWeblink;
        public PackageTypeMembers[] types;
        public String uninstallClass;
        public String version;
        private String[] apiAccessLevelTypeInfo = new String[]{'apiAccessLevel',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
        private String[] descriptionTypeInfo = new String[]{'description',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
        private String[] namespacePrefixTypeInfo = new String[]{'namespacePrefix',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
        private String[] objectPermissionsTypeInfo = new String[]{'objectPermissions',WebSOAPServiceHandler.SOAP_END_URI,null,'0','-1','false'};
        private String[] packageTypeTypeInfo = new String[]{'packageType',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
        private String[] postInstallClassTypeInfo = new String[]{'postInstallClass',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
        private String[] setupWeblinkTypeInfo = new String[]{'setupWeblink',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
        private String[] typesTypeInfo = new String[]{'types',WebSOAPServiceHandler.SOAP_END_URI,null,'0','-1','false'};
        private String[] uninstallClassTypeInfo = new String[]{'uninstallClass',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
        private String[] versionTypeInfo = new String[]{'version',WebSOAPServiceHandler.SOAP_END_URI,null,'1','1','false'};
        private String[] apex_schemaTypeInfo = new String[]{WebSOAPServiceHandler.SOAP_END_URI,'true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] fieldOrderTypeInfo = new String[]{'fullName', 'apiAccessLevel','description','namespacePrefix','objectPermissions','packageType','postInstallClass','setupWeblink','types','uninstallClass','version'};
   		
        public class PackageTypeMembers {
        	public String[] members;
        	public String name;
       		private String[] membersTypeInfo = new String[]{'members',WebSOAPServiceHandler.SOAP_END_URI,null,'0','-1','false'};
        	private String[] nameTypeInfo = new String[]{'name',WebSOAPServiceHandler.SOAP_END_URI,null,'1','1','false'};
        	private String[] apexSchemaTypeInfo = new String[]{WebSOAPServiceHandler.SOAP_END_URI,'true','false'};
        	private String[] fieldOrderTypeInfo = new String[]{'members','name'};
    }
      public class ProfileObjectPermissions {
        public Boolean allowCreate;
        public Boolean allowDelete;
        public Boolean allowEdit;
        public Boolean allowRead;
        public Boolean modifyAllRecords;
        public String object_x;
        public Boolean viewAllRecords;
        private String[] allowCreateTypeInfo = new String[]{'allowCreate',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
        private String[] allowDeleteTypeInfo = new String[]{'allowDelete',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
        private String[] allowEditTypeInfo = new String[]{'allowEdit',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
        private String[] allowReadTypeInfo = new String[]{'allowRead',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
        private String[] modifyAllRecordsTypeInfo = new String[]{'modifyAllRecords',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
        private String[] objectXTypeInfo = new String[]{'object',WebSOAPServiceHandler.SOAP_END_URI,null,'1','1','false'};
        private String[] viewAllRecordsTypeInfo = new String[]{'viewAllRecords',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
        private String[] apexSchemaTypeInfo = new String[]{WebSOAPServiceHandler.SOAP_END_URI,'true','false'};
        private String[] fieldOrderTypeInfo = new String[]{'allowCreate','allowDelete','allowEdit','allowRead','modifyAllRecords','object_x','viewAllRecords'};
    }
}