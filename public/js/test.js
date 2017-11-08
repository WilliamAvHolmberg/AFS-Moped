jQuery(document).ready(function() {
    var $mainTable = $("#mainTable");
    var splitBy = 37;
    var head = $mainTable.find ( "th" )
    if ($mainTable.find ( "tr" ).length > splitBy {
    var rows = $mainTable.find ( "tr" ).slice( splitBy );
    var $secondTable = $("#mainTable").parent().append("<table id='secondTable'><thead></thead><tbody></tbody></table>");
    $secondTable.find("thead").append(head);
    $secondTable.find("tbody").append(rows);
    $mainTable.find ( "tr" ).slice( splitBy ).remove();
    }
});
