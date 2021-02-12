({
	fetchData : function(component, fetchdata, numberOfRecords) {
        var dataPromise,
            latitude,
            longitude,
            fakerLib = this.mockdataLibrary.getfakerLibrary();
        
        fetchData.address = {type : function (){
            return {
                latitude : fakerLib.address.latitude(),
                longitude : fakerLib.address.longtude()
            };
        }};
        
        dataPromise = this.mockdataLibrary.lightningMochDataFaker(fetchData, numberOfRecords);
        dataPromise.then(function(results) {
            component.set('v.data', results);
        });
		
	}
});