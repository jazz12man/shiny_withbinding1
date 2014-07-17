var alanBinding = new Shiny.InputBinding();
$.extend(alanBinding, {
  find: function(scope) {
    return $(scope).find(".alanBinding")
  },
  getValue: function(el) {
    return $(el).text();
  },
  setValue: function(el) {
    $(el).text(value);
  },
  subscribe: function(el, callback) {
    $(el).on("change.alanBinding", function(event) {
      console.log("i have changed")
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".alanBinding");
  }
});
Shiny.inputBindings.register(alanBinding);