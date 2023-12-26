@isTest
private class OTMMUpdateFolderUnitTestCases {

    @isTest static void validateOTMMUpdateFolder() {
        OTMMUpdateFolder oTMMUpdateFolder = new OTMMUpdateFolder();
        OTMMUpdateFolder.Value value = new OTMMUpdateFolder.Value();
        value.type='type';
        value.value='value';
        OTMMUpdateFolder.Value_Z value_z = new OTMMUpdateFolder.Value_Z();
        value_z.value=value;
        OTMMUpdateFolder.Metadata metadata = new OTMMUpdateFolder.Metadata();
        metadata.value = value_z;
        OTMMUpdateFolder.Data data = new OTMMUpdateFolder.Data();
        List<OTMMUpdateFolder.Metadata> jsmetadata = new List<OTMMUpdateFolder.Metadata>();
        jsmetadata.add(metadata);
        data.metadata=jsmetadata;
        OTMMUpdateFolder.Edited_folder editedFolder = new OTMMUpdateFolder.Edited_folder();
        editedFolder.data=data;
        System.assert(true);
    }
}