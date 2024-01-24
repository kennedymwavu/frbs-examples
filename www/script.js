$(document).ready(function () {
  hide_auth_form_loader();
});

// show/hide password inputs:
function toggle_password(password_input_id) {
  let tag = $("#" + password_input_id);
  let type = tag.attr("type");
  tag.attr("type", type === "password" ? "text" : "password");
}

// disable:
function disable_tag(tag_id) {
  let tag = $("#" + tag_id);
  tag.prop("disabled", true);
}

// enable tag:
function enable_tag(tag_id) {
  let tag = $("#" + tag_id);
  tag.prop("disabled", false);
}

// auth form:
function show_auth_form_loader() {
  let loader = $("." + "auth_form_loader");
  loader.show();
}

function hide_auth_form_loader() {
  let loader = $("." + "auth_form_loader");
  loader.hide();
}

function disable_auth_btn(btn_id) {
  disable_tag(btn_id);
  show_auth_form_loader();
}

function enable_auth_btn(btn_id) {
  enable_tag(btn_id);
  hide_auth_form_loader();
}

Shiny.addCustomMessageHandler("enable_auth_btn", (message) => {
  enable_auth_btn(message["id"]);
});
