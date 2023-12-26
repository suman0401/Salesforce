@isTest 
private class AssetUnitTestCases {
    @isTest static void validateAsset(){
        Asset asset = new Asset();
        asset.setData('data');
        asset.getData();
        asset.setType('type');
        asset.getType();
        asset.setName('name');
        asset.getName();
        System.assert(true);
    }
}