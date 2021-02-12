({
	handleShowActiveSectionName : function(component, event, helper) {
		alert(cmp.find("accordion").get('v.activeSectionName'));
	},
    handleSetActiveSectionC: function(component, event, helper) {
        cmp.find("accordion").set('v.activeSectionName', 'C');
    }
});