import {sortable} from "./html5sortable";
import Rails from "@rails/ujs";

window.addEventListener("load", function(event) {
  sortable('.sortable', {
    forcePlaceholderSize: true,
    placeholderClass: 'ph-class',
    hoverClass: 'bg-maroon yellow'
  });

  if (sortable('.sortable')[0]) {
    sortable('.sortable')[0].addEventListener('sortupdate', (e) => {
      const updatedOrder = [];
      let idx = 0;

      [...document.getElementsByClassName('card')].forEach((i) => {
        updatedOrder.push({
          id: i.getAttribute('data-id'),
          position: idx += 1
        });

        const formattedData = JSON.stringify(updatedOrder);
        const formData = new FormData();

        formData.append('order', formattedData);

        Rails.ajax({
          type: "PUT",
          data: formData,
          url: '/portfolios/sort'
        });
      })
    });
  }
});