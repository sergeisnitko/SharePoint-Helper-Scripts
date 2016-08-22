// This commands script findes all ListView WebParts on current page that uses CSR to render  
// Author: Sergei Snitko
// Blog: http://blog.arvosys.ru/
// Last Update : 8/22/2016

var _spWebPartComponents = _spWebPartComponents ||  [];

for (var component in _spWebPartComponents) {
    var WebPart = _spWebPartComponents[component];
    if (WebPart) {
        var strViewId = WebPart.storageId;
        strViewId = strViewId.toUpperCase();

        if (g_ViewIdToViewCounterMap) {
            var ctxNum = g_ViewIdToViewCounterMap["{" + strViewId + "}"];
            if (ctxNum) {
                var ctxT = window["ctx" + ctxNum];
                if (ctxT) {
                    console.log(ctxT);
                    //Your code here
                }
            }
        }
    }
}