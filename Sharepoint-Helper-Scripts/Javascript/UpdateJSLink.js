var ListName = "NewQua";
var FieldName = "_x043e__x0434__x0438__x043d_";
var link = "~site/SiteAssets/CIBAssets/SPImageField/js/cib.applyto.js?201410311455|~site/SiteAssets/CIBAssets/SPImageField/js/cib.sp.simpleimagefield.js?201410311455";

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
