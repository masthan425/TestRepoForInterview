public class WebSOAPServiceRequest {
    public Double apiVersion;
    public String[] packageNames;
    public Boolean singlePackage;
    public String[] specificFiles;
    public PackageXML unpackaged;
    private String[] apiVersion_type_info = new String[]{'apiVersion',WebSOAPServiceHandler.SOAP_END_URI,null,'1','1','false'};
    private String[] packageNames_type_info = new String[]{'packageNames',WebSOAPServiceHandler.SOAP_END_URI,null,'0','-1','false'};
    private String[] singlePackage_type_info = new String[]{'singlePackage',WebSOAPServiceHandler.SOAP_END_URI,null,'1','1','false'};
    private String[] specificFiles_type_info = new String[]{'specificFiles',WebSOAPServiceHandler.SOAP_END_URI,null,'0','-1','false'};
    private String[] unpackaged_type_info = new String[]{'unpackaged',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
    private String[] apex_schema_type_info = new String[]{WebSOAPServiceHandler.SOAP_END_URI,'true','false'};
    private String[] field_order_type_info = new String[]{'apiVersion','packageNames','singlePackage','specificFiles','unpackaged'};

}