public class WebSOAPServiceResponse {
        public AsyncResult result;
        private String[] result_type_info = new String[]{'result',WebSOAPServiceHandler.SOAP_END_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{WebSOAPServiceHandler.SOAP_END_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'result'};

        public class AsyncResult {
        public Boolean done;
        public String id;
        public String message;
        public String state;
        public String statusCode;
        private String[] done_type_info = new String[]{'done',WebSOAPServiceHandler.SOAP_END_URI,null,'1','1','false'};
        private String[] id_type_info = new String[]{'id',WebSOAPServiceHandler.SOAP_END_URI,null,'1','1','false'};
        private String[] message_type_info = new String[]{'message',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
        private String[] state_type_info = new String[]{'state',WebSOAPServiceHandler.SOAP_END_URI,null,'1','1','false'};
        private String[] statusCode_type_info = new String[]{'statusCode',WebSOAPServiceHandler.SOAP_END_URI,null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{WebSOAPServiceHandler.SOAP_END_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'done','id','message','state','statusCode'};
    }
}