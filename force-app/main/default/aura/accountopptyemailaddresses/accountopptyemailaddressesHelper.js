({
	filterEmails : function(people) {
        return this.getgetEmailsFromList(people.to).contact(
        this.getEmailsFromList(people.cc));
		
	},
    
    getEmailFromList : function(list){
        var ret = [];
        for (var i in list) {
            ret.push(list[i].email);
        }
        return ret;
    }
})