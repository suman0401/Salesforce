public with sharing class AssetsWrapper {
    public Asset[] assets;
    public AssetsWrapper() {

    }
    public Asset[] getAssets(){
        return this.assets;
    }
    public void setAssets(Asset[] assets){
        this.assets = assets;
    } 
}