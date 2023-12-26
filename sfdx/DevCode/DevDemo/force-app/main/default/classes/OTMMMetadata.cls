public class OTMMMetadata {

    public OTMMMetadata() {

    }
	public Metadata_model_resource metadata_model_resource {get;set;} 
	
	public class Metadata_element_list_Z {
		public String type_Z {get;set;} // in json: type
		public String id {get;set;} 
		public String name {get;set;} 
		public List<Metadata_element_list> metadata_element_list {get;set;} 
		public Integer legacy_id {get;set;} 

		public Metadata_element_list_Z(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'type') {
							type_Z = parser.getText();
						} else if (text == 'id') {
							id = parser.getText();
						} else if (text == 'name') {
							name = parser.getText();
						} else if (text == 'metadata_element_list') {
							metadata_element_list = arrayOfMetadata_element_list(parser);
						} else if (text == 'legacy_id') {
							legacy_id = parser.getIntegerValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Metadata_element_list_Z consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	


	public OTMMMetadata(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'metadata_model_resource') {
						metadata_model_resource = new Metadata_model_resource(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'JSON2Apex consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class Metadata_model {
		public String id {get;set;} 
		public String name {get;set;} 
		public List<Metadata_element_list_Z> metadata_element_list {get;set;} 
		public Boolean has_multilingual_fields {get;set;} 
		public Integer legacy_id {get;set;} 
		public String object_type {get;set;} 

		public Metadata_model(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'id') {
							id = parser.getText();
						} else if (text == 'name') {
							name = parser.getText();
						} else if (text == 'metadata_element_list') {
							metadata_element_list = arrayOfMetadata_element_list_Z(parser);
						} else if (text == 'has_multilingual_fields') {
							has_multilingual_fields = parser.getBooleanValue();
						} else if (text == 'legacy_id') {
							legacy_id = parser.getIntegerValue();
						} else if (text == 'object_type') {
							object_type = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Metadata_model consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Metadata_element_list {
		public String type_Z {get;set;} // in json: type
		public String id {get;set;} 
		public String name {get;set;} 
		public Boolean analytics {get;set;} 
		public String column_name {get;set;} 
		public Integer data_length {get;set;} 
		public String data_type {get;set;} 
		public Boolean displayable {get;set;} 
		public Boolean domained {get;set;} 
		public String edit_type {get;set;} 
		public Boolean editable {get;set;} 
		public Boolean enabled {get;set;} 
		public Boolean facetable {get;set;} 
		public Boolean multilingual {get;set;} 
		public String prompt {get;set;} 
		public Boolean required {get;set;} 
		public Integer scale {get;set;} 
		public Boolean searchable {get;set;} 
		public String searchable_scope_id {get;set;} 
		public Boolean sortable {get;set;} 
		public String table_name {get;set;} 
		public Boolean trigger_field {get;set;} 

		public Metadata_element_list(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'type') {
							type_Z = parser.getText();
						} else if (text == 'id') {
							id = parser.getText();
						} else if (text == 'name') {
							name = parser.getText();
						} else if (text == 'analytics') {
							analytics = parser.getBooleanValue();
						} else if (text == 'column_name') {
							column_name = parser.getText();
						} else if (text == 'data_length') {
							data_length = parser.getIntegerValue();
						} else if (text == 'data_type') {
							data_type = parser.getText();
						} else if (text == 'displayable') {
							displayable = parser.getBooleanValue();
						} else if (text == 'domained') {
							domained = parser.getBooleanValue();
						} else if (text == 'edit_type') {
							edit_type = parser.getText();
						} else if (text == 'editable') {
							editable = parser.getBooleanValue();
						} else if (text == 'enabled') {
							enabled = parser.getBooleanValue();
						} else if (text == 'facetable') {
							facetable = parser.getBooleanValue();
						} else if (text == 'multilingual') {
							multilingual = parser.getBooleanValue();
						} else if (text == 'prompt') {
							prompt = parser.getText();
						} else if (text == 'required') {
							required = parser.getBooleanValue();
						} else if (text == 'scale') {
							scale = parser.getIntegerValue();
						} else if (text == 'searchable') {
							searchable = parser.getBooleanValue();
						} else if (text == 'searchable_scope_id') {
							searchable_scope_id = parser.getText();
						} else if (text == 'sortable') {
							sortable = parser.getBooleanValue();
						} else if (text == 'table_name') {
							table_name = parser.getText();
						} else if (text == 'trigger_field') {
							trigger_field = parser.getBooleanValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Metadata_element_list consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Metadata_model_resource {
		public Metadata_model metadata_model {get;set;} 

		public Metadata_model_resource(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'metadata_model') {
							metadata_model = new Metadata_model(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Metadata_model_resource consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	public static OTMMMetadata parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new OTMMMetadata(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
	




    private static List<Metadata_element_list_Z> arrayOfMetadata_element_list_Z(System.JSONParser p) {
        List<Metadata_element_list_Z> res = new List<Metadata_element_list_Z>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Metadata_element_list_Z(p));
        }
        return res;
    }


    private static List<Metadata_element_list> arrayOfMetadata_element_list(System.JSONParser p) {
        List<Metadata_element_list> res = new List<Metadata_element_list>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Metadata_element_list(p));
        }
        return res;
    }


}