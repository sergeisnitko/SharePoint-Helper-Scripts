// This commands script file publishes files in SharePoint libraries
// Author: Sergei Snitko
// Blog: http://blog.arvosys.ru/
// Last Update : 8/21/2015

var ListName = "NewQua";
var FieldName = "FileName";
var link = "~site/SiteAssets/SPF/SPImageField/js/cib.applyto.js|~site/SiteAssets/SPF/SPImageField/js/cib.sp.simpleimagefield.js";

var clientContext = new SP.ClientContext();
var web = clientContext.get_web();

var lists = web.get_lists();
var targetList = lists.getByTitle(ListName);
var fields = targetList.get_fields();

var selectedField = fields.getByInternalNameOrTitle(FieldName);
selectedField.set_jsLink(link);

selectedField.update();

clientContext.load(selectedField);
clientContext.executeQueryAsync(
	function (data) {
	    console.log("jslink updated");
	},
	function (sender, args) {
	    console.log('Request failed. ' + args.get_message() + '\n' + args.get_stackTrace());
	}
);
