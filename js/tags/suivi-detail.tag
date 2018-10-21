<suivi-detail>
  <suivi-navbar />
  <section class="mb-4">
    <suivi-breadcrumb />
  </section>
  <section class="container-fluid">
    <section class="row">
      <section class="col-sm-6">
        <h1><span class="badge badge-success">Priorité normale</span> Prescription n°<strong>{prescription.order.id}</strong></h1>
        <p class="h4"><small class="text-muted"><i class="fas fa-user-md mr-2"></i>Docteur anesthésite John Doe - Chirurgie - CHU de DIJON</small></p>
      </section>
      <section class="col-sm-3 offset-sm-3 mb-4">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Pris en charge par</h5>
            <p class="font-weight-bold mb-0">Mr. Sébastien SIMONOT</p>
            <ul class="text-muted list-inline">
              <li class="list-inline-item"><i class="fas fa-phone mr-2"></i> 0600000000</li>
              <li class="list-inline-item"><i class="fas fa-map-marker-alt"></i> Bureau 221</li>
            </ul>
          </div>
        </div>
      </section>
    </section>
    <section class="row mb-4">
      <section class="col-sm-7 mb-4">
        <section class="position-sticky sticky-top mt-4">
          <suivi-progressbar />
          <div class="card">
            <div class="card-header">
              <i class="fas fa-user mr-2"></i>Informations patient
            </div>
            <div class="card-body">
              <dl class="row mb-0">
                <dt class="col-sm-3">Nom</dt>
                <dd class="col-sm-3">Doe</dd>
                <dt class="col-sm-3">Prénom</dt>
                <dd class="col-sm-3">John</dd>
                <dt class="col-sm-3">Nom d'usage<dt>
                <dd class="col-sm-3">Doe</dd>
                <dt class="col-sm-3">Date de naissance<dt>
                <dd class="col-sm-3">01 / 01 / 1988</dd>
              </dl>
            </div>
            <div class="card-header border-top bg-danger text-white">
              <i class="fas fa-box mr-2"></i> Informations commande
            </div>
            <div class="card-body">
              <dl class="row mb-0">
                <dt class="col-sm-3">Phénotype</dt>
                <dd class="col-sm-3">AB-</dd>
                <dt class="col-sm-3">Transfusion prévu le</dt>
                <dd class="col-sm-3">19 / 10 / 2018</dd>
                <dt class="col-sm-3">Protocol transfusion<dt>
                <dd class="col-sm-3">RAS</dd>
              </dl>
            </div>
          </div>
        </section>
      </section>
      <section class="col-sm-5">
        <img src="./img/doc_scanne.jpg" alt="" width="100%"/>
      </section>
    </section>
    <section class="row">
      <section class="col-sm-7">
      </section>
    </section>
  </section>
  <script>
    this.identificationKey;
    this.prescription = 
      { 
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
            id: '',
            amount: 2,
            bloodType: "AB-",
            transfusionProtocol: "RAS",
            transfusionTime: "2018-10-19T16:16:30Z"
          },
          urgency: "low",
      };

    this.on('route', identificationKey => {
      this.identificationKey = identificationKey;
      this.prescription.order.id = identificationKey;
      this.update();
    });

    this.on('mount', () => {
      Suivi.fetchPrescription(this.identificationKey)
        .then(res => {
          //this.prescription = res[0];
          //console.log(res[0]);
        });
    });
  </script>
</suivi-detail>
