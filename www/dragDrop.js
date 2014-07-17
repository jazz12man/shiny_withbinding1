function dragUser(user, event) {
  event.dataTransfer.setData('User', user.id);
}
function dropUser(target, event) {
  var user = event.dataTransfer.getData('User');
  target.appendChild(document.getElementById(user));
  var g1 = $.map($("#group1 span"), function(elem, index){
    return $(elem).html();
  }).join("|");
  var g2 = $.map($("#group2 span"), function(elem, index){
    return $(elem).html();
  }).join("|");
  var unass = $.map($("#unassigned span"), function(elem, index){
    return $(elem).html();
  }).join("|");
  if($("#group1_update").text() !== g1 ) {
    $("#group1_update").text(g1);
    $("#group1_update").trigger("change")
  }
  if($("#group2_update").text() !== g2 ) {
    $("#group2_update").text(g2)
    $("#group2_update").trigger("change")
  }
  $("#unass_update").text(unass);
}

