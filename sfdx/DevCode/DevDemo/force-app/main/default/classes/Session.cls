public class Session{

    public String domain_name;
	public String id;
	public boolean local_session;
	public String login_name ;
	public String message_digest;
	public String role_name;
	public String user_full_name;
	public String user_id ;
	public String user_role_id;
	public Long validation_key;

   
    public string getId()
    {
        return id;
    }
    public void SetId(String id)
    {
        this.id=id;
    } 

   
   
}