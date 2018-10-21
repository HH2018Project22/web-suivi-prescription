<suivi-list>
  <table class="table">
    <thead>
      <tr>
        <th>Urgences</th>
        <th>Dates transfusion</th>
        <th>Phénotypes</th>
        <th>Genre</th>
        <th>Age</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <tr each={pres,key in prescriptions}>
        <td class="font-weight-bold">{ emergencyBadge(pres.prescription.urgency) }</td>
        <td>{ moment(pres.prescription.order.transfusionTime).format('LLL') }</td>
        <td>{ pres.prescription.order.bloodType }</td>
        <td>{ pres.prescription.patient.sex }</td>
        <td>{ calculAge(pres.prescription.patient.birthDate) }</td>
        <td><a href="#/prescription/{pres.hash}/detail" class="btn btn-primary btn-block btn-sm"><i class="fa fa-eye"></i> Voir</a></td>
      </tr>
    </tbody>
  </table>
  <script>
    calculAge = function(from) {
      let f = moment(from);
      let now = moment();
      return now.diff(f, 'years');
    }
    getGender = function(sex) {
      switch(sex) {
        case 'female': return 'Femme';
        case 'male'  : return 'Homme';
        default      : return 'Autre';
      }
    }
    emergencySchemeColor = function(emergencyLevel) {
      let classNames = '';
      if (emergencyLevel === 'low') {
        classNames += 'bg-success';
      }
      if (emergencyLevel === 'high') {
        classNames += 'bg-warning';
      }
      if (emergencyLevel === 'emergency') {
        classNames += 'bg-danger';
      }
      return classNames; 
    }

    emergencyBadge = function(emergencyLevel) {
      let badge = '';
      if (emergencyLevel === 'low') {
        badge += 'Priorité normale';
      }
      if (emergencyLevel === 'high') {
        badge += 'Priorité haute';
      }
      if (emergencyLevel === 'emergency') {
        badge += 'Priorité vitale';
      }
      
      return badge;
      
    }
    
    Suivi.Store.on('prescriptions', () => this.update());
    this.on('before-mount', () => {
      this.prescriptions = [];
    })

    Suivi.prescriptions()
      .then(res => {
        this.prescriptions = res;
        this.update();
        console.log(res);
      });
    
    //this.prescriptions = [
    //  {
    //    created_at: Date.now(),
    //    emergency: 'emergency',
    //    bloodType: 'O',
    //    scheduled_at: ''
    //  },
    //  {
    //    created_at: Date.now(),
    //    emergency: 'high',
    //    bloodType: 'A+',
    //    scheduled_at: ''
    //  },
    //  {
    //    created_at: Date.now(),
    //    emergency: 'low',
    //    bloodType: 'AB-',
    //    scheduled_at: ''
    //  }
    //];
  </script>
</suivi-list>
