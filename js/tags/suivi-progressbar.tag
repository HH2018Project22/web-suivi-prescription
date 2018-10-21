<suivi-progressbar>
  <div class="clearfix mb-4">
    <ul class="progressbar">
      <li class="active">Prescrit</li>
      <li class={state("received")}>En traitement</li>
      <li class={state("packaging")}>En préparation</li>
      <li class={state("packaged")}>Préparé</li>
      <li class={state("delivering")}>En livraison</li>
      <li class={state("delivered")}>Livré</li>
      <li class={state("transfused")}>Transfusé</li>
    </ul>
  </div>
  <style>
    .progressbar li {
      width: 14% !important;
      font-size: 16px;
    }
  </style>
  <script>

    const sequence = [
      "received",
      "packaging",
      "packaged",
      "delivering",
      "delivered",
      "transfused"
    ];

    this.on('update', () => {
      this.notifications = this.opts.notifications;
    });
    state(notificationType) {

      const { notifications } = this;
      if (!notifications) return '';

      let state = "";

      if (this.hasNotification(notificationType)) {
        state = "active";
      }

      const seqIndex =  sequence.indexOf(notificationType);
      const nextNotificationType = sequence[seqIndex+1];

      console.log(notificationType, nextNotificationType)

      if ( this.hasNotification(notificationType) && !this.hasNotification(nextNotificationType) ){
        state = "running";
      }

      return state;
    }

    hasNotification(notificationType) {
      if(!this.notifications) return false;
      for (let n, i = 0; (n = this.notifications[i]); i++) {
        if (n.notification === notificationType) return true;
      }
      return false;
    }
  </script>
</suivi-progressbar>
