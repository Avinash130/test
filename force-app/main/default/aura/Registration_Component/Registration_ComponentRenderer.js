({
	// Your renderer method overrides go here
    render: function(component,helper) {
        var a = this.superRender();
        console.log("This text is from render function which gets executed when component is initiated");
        return a;
    },
    
    afterRender : function(component,helper) {
    // call base afterrender method
    this.superAfterRender();
    // interact with DOM elements
    console.log("This text should come from after render() is over");
    console.log("This text is from After render function");
    
},
    rerender : function(component,helper) {
        // call base rerender method
        this.superRerender();
        console.log("This text is from rerender function which gets called when ever any data change is occurs");
    },
    unrender: function() {
        // call base unrender method
         this.superUnrender();
        console.log("This text is From when unrender function is destroyed");
    }
})