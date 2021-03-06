<suivi-detail>
  <suivi-navbar />
  <section class="mb-4">
    <suivi-breadcrumb />
  </section>
  <section class="container-fluid">
    <section class="row">
      <section class="col-sm-6">
        <h1><span class="badge badge-success">{priority()}</span> Prescription n°<strong>{prescription.order.id}</strong></h1>
        <p class="h4"><small class="text-muted"><i class="fas fa-user-md mr-2"></i>{prescriptor()}</small></p>
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
          <suivi-progressbar notifications={notifications} />
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
    this.prescription = null;

    this.on('route', identificationKey => {
      this.identificationKey = identificationKey;
    });

    this.on('mount', () => {
      Suivi.fetchPrescription(this.identificationKey)
        .then(res => {
          this.prescription = res;
          this.update();
        });
      Suivi.fetchNotifications(this.identificationKey)
        .then(res => {
          this.notifications = res;
          this.update();
        });
    });

    priority() {
      if (!this.prescription) return "Priorité normale";
      if (this.prescription.urgency === 'low') return "Priorité normale";
      if (this.prescription.urgency === 'high') return "Priorité haute";
      if (this.prescription.urgency === 'emergency') return "Priorité vitale";
    }

    prescriptor() {
      if (!this.prescription) return "--";
      const { prescriptor } = this.prescription;
      return `${prescriptor.firstName} ${prescriptor.lastName} - ${prescriptor.service}`;
    }
  </script>
</suivi-detail>
