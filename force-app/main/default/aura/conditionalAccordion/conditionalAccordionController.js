({
	handleShowActiveSectionName : function(component, event, helper) {
		alert(cmp.find("accordion").get('v.activeSectionName'));
	},
    
    handleToggleSectionD: function(cmp) {
        cmp.set('v.isDVisible',!cmp.get('v.v.isDVisible'));
    }
})