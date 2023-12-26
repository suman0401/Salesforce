public class FolderCreationResponse {

    public FolderCreationResponse() {

    }

	public class Security_policy_list {
        public Security_policy_list() {

        }
		public Integer id{get;set;} 
		public String status{get;set;} 
	}

	public class Entry {
        public Entry() {

        }
		public String key{get;set;} 
		public Boolean value{get;set;} 
	}

	public Folder_resource folder_resource;

	public class Metadata {
        public Metadata() {

        }
		public String id{get;set;} 
		public List<Metadata_element_list> metadata_element_list{get;set;} 
	}

	public class Access_control_descriptor {
        public Access_control_descriptor() {

        }
		public Permissions_map permissions_map{get;set;} 
	}

	public class Folder_resource {
        public Folder_resource() {

        }
		public Folder folder{get;set;} 
	}

	public class Metadata_element_list {
        public Metadata_element_list() {

        }
	}

	public class Folder {
        public Folder() {

        }
		public Access_control_descriptor access_control_descriptor{get;set;} 
		public String asset_id{get;set;} 
		public String asset_state{get;set;} 
		public String asset_state_last_update_date{get;set;} 
		public String asset_state_user_id{get;set;} 
		public Boolean checked_out{get;set;} 
		public Boolean content_editable{get;set;} 
		public String content_state{get;set;} 
		public String content_type{get;set;} 
		public String creator_id{get;set;} 
		public String data_type{get;set;} 
		public String date_imported{get;set;} 
		public String date_last_updated{get;set;} 
		public Boolean deleted{get;set;} 
		public Boolean expired;
		public Integer import_job_id;
		public Boolean latest_version;
		public Integer legacy_model_id;
		public Boolean locked{get;set;} 
		public Metadata metadata{get;set;} 
		public String metadata_model_id{get;set;} 
		public String name{get;set;} 
		public String original_asset_id{get;set;} 
		public List<Security_policy_list> security_policy_list{get;set;} 
		public Integer version{get;set;} 
		public String container_id{get;set;} 
		public String container_type_id{get;set;} 
		public Boolean in_review{get;set;} 
	}

	public class Permissions_map {
        public Permissions_map() {

        }
		public List<Entry> entry{get;set;} 
	}

	
	public static FolderCreationResponse parse(String json) {
		return (FolderCreationResponse) System.JSON.deserialize(json, FolderCreationResponse.class);
	}
}