<suivi-list>
  <table class="table table-bordered table-hover">
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
      <tr each={pres,key in prescriptions} class="bg-{ emergencyShemeColor(pres.prescription.urgency) }">
        <td class="text-center text-{emergencySchemeColor(pres.prescription.urgency)}" width="180px">
          <span class="text-uppercase font-weight-bold">
            <i class="fas fa-exclamation-circle" if={ pres.prescription.urgency == 'emergency'}></i>
            { emergencyBadge(pres.prescription.urgency) }
          </span>
        </td>
        <td>{ moment(pres.prescription.order.transfusionTime).format('LLL') }</td>
        <td>{ pres.prescription.order.bloodType }</td>
        <td>{ getGender(pres.prescription.patient.sex) }</td>
        <td>{ calculAge(pres.prescription.patient.birthDate) }</td>
        <td><a href="#/prescription/{pres.hash}/detail" class="btn btn-primary btn-block"><i class="fa fa-eye"></i> Voir le détail</a></td>
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
    this.prescriptions = [
      {
        hash: "123456",
        prescription: {
          patient: {
            firstName: "Jane",
            lastName: "Doe",
            useName: "Doe",
            birthDate: "1988-01-01",
            sex: "female"
          },
          prescriptor: {
            firstName: "Doctor",
            lastName: "Who",
            service: "Time Lords"
          },
          order: {
            id: "1",
            amount: 2,
            bloodType: "AB-",
            transfusionProtocol: "RAS",
            transfusionTime: "2018-10-19T16:16:30Z"
          },
          urgency: "low",
        }
      },
      {
        hash: "654321",
        prescription: {
          patient: {
            firstName: "Jane",
            lastName: "Doe",
            useName: "Doe",
            birthDate: "1988-01-01",
            sex: "female"
          },
          prescriptor: {
            firstName: "Doctor",
            lastName: "Who",
            service: "Time Lords"
          },
          order: {
            id: "1",
            amount: 2,
            bloodType: "AB-",
            transfusionProtocol: "RAS",
            transfusionTime: "2018-10-19T16:16:30Z"
          },
          urgency: "emergency",
        }
      }
    ]
    emergencySchemeColor = function(emergencyLevel) {
      if (emergencyLevel === 'low') {
        classNames = 'success';
      }
      if (emergencyLevel === 'high') {
        classNames = 'warning';
      }
      if (emergencyLevel === 'emergency') {
        classNames = 'danger';
      }
      return classNames;
    }
    emergencyIcon = function(emergencyLevel) {
      if (emergencyLevel === 'low') {
        classNames = 'fa-bars';
      }
      if (emergencyLevel === 'high') {
        classNames = 'fa-exclamation-circle';
      }
      if (emergencyLevel === 'emergency') {
        classNames = 'fa-exclamation-circle';
      }
      return classNames;
    }

    emergencyBadge = function(emergencyLevel) {
      let badge = '';
      if (emergencyLevel === 'low') {
        badge += 'normale';
      }
      if (emergencyLevel === 'high') {
        badge += 'haute';
      }
      if (emergencyLevel === 'emergency') {
        badge += 'vitale';
      }

      return badge;

    }

    Suivi.Store.on('prescriptions', () => this.update());
    this.on('before-mount', () => {
      this.prescriptions = this.prescriptions;
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
