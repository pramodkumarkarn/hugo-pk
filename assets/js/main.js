$(function() {
  //plugin to make all external links open in a new window
  https://gist.github.com/createlogic/3070615
	$.fn.extLink = function(options){
	    
	    var defaults = {fileTypes:""};
	    var opts = $.extend(defaults,options);
	    var typesArray = opts.fileTypes.split(',');
	    var extValid = new RegExp('/'+window.location.host+'/');
	        
	    return this.each(function(){

	    	if(!extValid.test(this.href)) {
	    		this.target="_blank";
	    	}
	    	else {
		    	if(typesArray[0]!=="") {
		    		for(var i=0;i<typesArray.length;i=i+1) {
		    			if(this.href.indexOf(typesArray[i])>-1) {
		    				this.target="_blank";
		    			}
		    		}
		    	}
	    	}
	    		
	    });
	};

  //make all outbound links open in a new window
  $("a").extLink();
});
