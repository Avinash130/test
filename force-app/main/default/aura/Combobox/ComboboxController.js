({
    init: function (cmp) {
        // This will contain the string of the "value" attribute of the selected option
        var items = [];
        for(var i=0; i<500; i++) {
            var item = {
                "label": i + " Option" ,
                "value": i.toString()
            };
            items.push(item);
        }
        cmp.set("v.options", items);
    },
    
    handleChange: function(cmp, event) {
        var selectedOptionValue = event.getParams("value");
        alert("Option selected with value: '" + selectedOptionValue + "'");
    }
});