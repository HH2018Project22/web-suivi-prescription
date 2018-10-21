(function(Suivi) {

  const BASE_URL = 'https://hhp22-tcornaut.localtunnel.me';

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

}(window.Suivi = window.Suivi || {}))

