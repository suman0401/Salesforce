({
	// Your renderer method overrides go here
    render : function(cmp,hel){
        var returnVal= this.superRender();
        alert('I am from render method');
        return returnVal;
    },
    afterRender: function(cmp,helper){
        this.superAfterRender();
        alert('I am loaded ');        
    },
    rerender: function(cmp,helper){
          this.superRerender();
        alert('You are making some changes');
    },
    unRender: function(cmp,helper){
          this.superUnRender();
        alert('Bye Bye');     
    }
})