
// Sets a toggle on our menu to show/hide
// 
// Returns nothing
function toggle_hamburger_menu() {
  document.getElementById("hamburger_list").classList.toggle("hide");
}

window.onload = function() {
  document.getElementById("hamburger").addEventListener("click", toggle_hamburger_menu); 
}