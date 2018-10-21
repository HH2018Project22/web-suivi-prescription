(function(Suivi) {

  const BASE_URL = 'http://localhost:3000';

  Suivi.prescriptions = function() {
    return fetch(`${BASE_URL}/prescriptions`)
      .then(res => res.json())
      .then(res => {
        if(res.error) {
          Suivi.Store.update('prescription', null);
          return null;
        }
        const prescriptions = res;
        if (prescriptions.length === 0) {
          Suivi.Store.update('prescription', null);
          return null;
        }
        Suivi.Store.update('prescriptions', prescriptions);
        return prescriptions;
      })
    ;
  };

  Suivi.fetchPrescription = function(key) {
    return fetch(`${BASE_URL}/prescriptions/${key}`)
      .then(res => res.json())
      .then(res => {
        if(res.error) return null;
        return res;
      })
    ;
  };

  Suivi.fetchNotifications = function(key) {
    return fetch(`${BASE_URL}/prescriptions/${key}/notifications`)
      .then(res => res.json())
      .then(res => {
        if(res.error) return null;
        return res;
      })
    ;
  }

}(window.Suivi = window.Suivi || {}))

