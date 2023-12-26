public with sharing class Asset {
    public String data;
    public String type;
    public String name; 
    public Asset() {

    }
    public String getData()
    {
        return this.data;
    }
    public void setData(String data)
    {
        this.data = data;
    } 
    public String getType()
    {
        return this.type;
    }
    public void setType(String type)
    {
        this.type = type;
    } 
    public String getName()
    {
        return this.name;
    }
    public void setName(String name)
    {
        this.name = name;
    } 
}