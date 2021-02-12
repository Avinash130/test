({
	helperRecifySequence : function(component,event,helper) {
		var indexNo = component.get('v.indexNo');
        var New  = parseInt((indexNo.length) + 1);
        component.set('v.sequenceNo', New);
	}
})