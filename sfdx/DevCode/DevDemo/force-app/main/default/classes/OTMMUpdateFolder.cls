public class OTMMUpdateFolder {

	public Edited_folder edited_folder {get;set;} 

	public OTMMUpdateFolder() {

    }
	
	
	public class Value {
		public String type {get;set;} // in json: type
		public String value {get;set;} 
		public Value() {

        }
	}
	
	public class Metadata {
		public String id {get;set;} 
		public String type {get;set;} // in json: type
		public Value_Z value {get;set;} 
		public Metadata() {

        }
	}
	
	public class Edited_folder {
		public Data data {get;set;} 
		public Edited_folder() {

        }
	}
	
	public class Value_Z {
		public Value value {get;set;} 
		public Value_Z() {

        }
	}
	
	public class Data {
		public List<Metadata> metadata {get;set;} 
		//public Security_policies security_policies {get;set;} 
		public Data() {

        }
	}
	
	public class Security_policies {
		public String edit_mode {get;set;} 
		public List<Integer> security_policy_ids {get;set;} 
		public Security_policies() {

        }

		
	}

}