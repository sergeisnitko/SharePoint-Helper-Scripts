// This commands script file publishes files in SharePoint libraries
// Author: Sergei Snitko
// Blog: http://blog.arvosys.ru/
// Last Update : 8/21/2016

var PublishDocuments = function(params){
    var self = this;

    var params = params || {};
    var folder = params.folder || "";
    var listServerRelativeUrl = params.listServerRelativeUrl || "";
    var listName = params.listName || "";
    var recursive = params.recursive ? 'Scope="Recursive"' : "";

    console = console || {};
    console.log = console.log || function(){};

    this.Publish = function(){
        if (listName){
            EnsureScript('sp.js', typeof SP.ClientContext, function () {
                var clientContext = SP.ClientContext.get_current();
                var web = clientContext.get_web();		
                //var list = web.getList(listServerRelativeUrl);
				var list = web.get_lists().getByTitle(listName)

                clientContext.load(list);

                var camlQuery = new SP.CamlQuery();
                if (folder) {
                    camlQuery.set_folderServerRelativeUrl(folder);
				}

                camlQuery.set_viewXml(
					'<View ' + recursive + '>'+
						'<Query>'+
							'<Where>'+
								'<Neq>'+
									'<FieldRef Name="_ModerationStatus" />'+
									'<Value Type="ModStat">0</Value>'+
								'</Neq>'+
							'</Where>'+
						'</Query>'+
					'</View>');
                var itemsResults = list.getItems(camlQuery);
                self.items = clientContext.loadQuery(itemsResults);

                clientContext.executeQueryAsync(function (data) {
					if(self.items.length > 0){
						console.log("Starting publishing:");
					} else {
						console.log("All files are already published.");
					}		
					for (var i = 0, ilen = self.items.length; i < ilen; i += 1){                            
						var item = self.items[i];
						var values = item.get_fieldValues();

						var file = web.getFileByServerRelativeUrl(item.get_fieldValues()["FileRef"]);
						if (values["CheckedOutUserId"].get_lookupValue()){
						   file.checkIn();                                
						}
						//console.log(item.get_fieldValues()["_ModerationStatus"]);
						file.publish();  
						console.log(">>", file.get_path());   			                        
					}
			
					if(self.items.length > 0){
						clientContext.executeQueryAsync(function (data) {
							console.log("Files are published");
						}, function(sender,args){
							self.AsyncError("Error during publishing", sender, args);
						});   
					}            
				}, function (sender, args) {
                        self.AsyncError("Error during publishing", sender, args);
                });
            });        
        }
    };
    this.AsyncError = function(fName, sender, args){
        console.log(fName + ': Request failed. ' + args.get_message() + '\n' + args.get_stackTrace());
    };

    //Execute on creation
    this.Publish();
};    

// Exec publishing example
(function(){
    new PublishDocuments({
        folder:"/_catalogs/masterpage/Display Templates/SPF",
        recursive: true,
        listName: "Master Page Gallery"
    })
})();