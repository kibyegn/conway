$(function create_grid() {
  var $wrap = $('<div>').attr('id', 'world_container');
  var $tbl = $('<table>').attr('id', 'world');
  for (var i = 0; i < 200; i++) {
    $tbl.append($('<tr>').append($('<td>').text(i),
    $('<td>').text(200 - i)));
  }
  $wrap.append($tbl);
  $('body').append($wrap);
});
