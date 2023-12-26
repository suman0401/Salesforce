@isTest
private class AssetWrapperUnitTestCases {
    @isTest static void validateAssetWrapper() {
        Asset asset1 = new Asset();
        asset1.setData('data');
        asset1.getData();
        asset1.setType('type');
        asset1.getType();
        asset1.setName('name');
        asset1.getName();

        Asset[] assets = new Asset[1];
        assets[0] =  asset1;

        AssetsWrapper assetWrapper = new AssetsWrapper();
        assetWrapper.setAssets(assets);
        assetWrapper.getAssets();

        System.assert(true);
    }
}