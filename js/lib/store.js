(function(Suivi) {

  "use strict";

  const Store = Suivi.Store = riot.observable();

  Store.user = null;

  Store.update = function(key, val) {
    if (key === 'update') throw new Error("The 'update' key is a reserved word.");
    const old = Store[key];
    Store[key] = val;
    Store.trigger(key, val, old);
  };

}(window.Suivi = window.Suivi || {}))

