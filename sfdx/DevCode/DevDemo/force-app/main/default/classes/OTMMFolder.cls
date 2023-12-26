public class OTMMFolder {

    public OTMMFolder() {

    }

	public class Security_policy_list {

		public Security_policy_list() {

		}
		public Integer id {get;set;} 

		public Security_policy_list(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'id') {
							id = parser.getIntegerValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Security_policy_list consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public Folder_resource folder_resource {get;set;} 

	public OTMMFolder(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'folder_resource') {
						folder_resource = new Folder_resource(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'JSON2Apex consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class Value {
		public Value(){

		}
		public String type {get;set;} // in json: type
		public String value {get;set;} 

		public Value(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'type') {
							type = parser.getText();
						} else if (text == 'value') {
							value = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Value consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Metadata {
		public Metadata(){

		}
		public List<Metadata_element_list> metadata_element_list {get;set;} 

		public Metadata(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'metadata_element_list') {
							metadata_element_list = arrayOfMetadata_element_list(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Metadata consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Value_Z {
		public Value_Z(){

		}
		public Value value {get;set;} 

		public Value_Z(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'value') {
							value = new Value(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Value_Z consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Folder_resource {
		public Folder_resource(){

		}
		public Folder folder {get;set;} 

		public Folder_resource(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'folder') {
							folder = new Folder(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Folder_resource consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Metadata_element_list {
		public Metadata_element_list(){

		}
		public String id {get;set;} 
		public String type {get;set;} // in json: type
		public Value_Z value {get;set;} 

		public Metadata_element_list(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'id') {
							id = parser.getText();
						} else if (text == 'type') {
							type = parser.getText();
						} else if (text == 'value') {
							value = new Value_Z(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Metadata_element_list consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Folder {
		public Folder(){
			
		}
		public String name {get;set;} 
		public String container_type_id {get;set;} 
		public List<Security_policy_list> security_policy_list {get;set;} 
		public Metadata metadata {get;set;} 
		public String metadata_model_id {get;set;} 

		public Folder(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'name') {
							name = parser.getText();
						} else if (text == 'container_type_id') {
							container_type_id = parser.getText();
						} else if (text == 'security_policy_list') {
							security_policy_list = arrayOfSecurity_policy_list(parser);
						} else if (text == 'metadata') {
							metadata = new Metadata(parser);
						} else if (text == 'metadata_model_id') {
							metadata_model_id = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Folder consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	public static OTMMFolder parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new OTMMFolder(parser);
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


    private static List<Metadata_element_list> arrayOfMetadata_element_list(System.JSONParser p) {
        List<Metadata_element_list> res = new List<Metadata_element_list>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Metadata_element_list(p));
        }
        return res;
    }




    private static List<Security_policy_list> arrayOfSecurity_policy_list(System.JSONParser p) {
        List<Security_policy_list> res = new List<Security_policy_list>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Security_policy_list(p));
        }
        return res;
    }


}