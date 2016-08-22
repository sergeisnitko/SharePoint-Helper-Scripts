// This commands script function helps to work make comfortable work with multilines strings
// Author: Sergei Snitko
// Blog: http://blog.arvosys.ru/
// Last Update : 8/22/2016


//Multilines string function
var MultiString = function (f) {
    var s = f.toString();
    var sarr = s.split('/**');
    if (sarr.length > 1){
        var subs = sarr[1];
        var s = subs.split('**/')[0];
    }
    return s;
};

//The use of function
MultiString(function () {/** 
    <li class="col-md-4 pb-card-wrapper employee-wrapper">
        <div class="pb-card">
        
        </div>
    </li>     
**/});