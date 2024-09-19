import { getCategories } from "./category.js";

export function getServices() {
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      console.log(this.response);

      const data = JSON.parse(this.response);
      const servicesContainer = document.getElementById("services");
    
      servicesContainer.innerHTML = "";
      let first = true;
      data.data.forEach((service) => {
        const serviceDiv = document.createElement("div");
        serviceDiv.className =
          first ? "flex p-2 gap-2 md:gap-3 items-center rounded-md w-56 bg-white cursor-pointer border-2 border-[#F52968] text-[#F52968] text-xs md:text-base" : "flex p-2 gap-2 md:gap-3 items-center rounded-md w-56 bg-white cursor-pointer text-xs md:text-base" ;

        first = false;


        serviceDiv.addEventListener("click", () => {
            // Remove active state from services
            const services = document.querySelectorAll("#services > div");
            services.forEach((service) => {
              service.className =
                "flex p-2 gap-2 md:gap-3 items-center rounded-md w-56 bg-white cursor-pointer text-xs md:text-base";
            });
        
            // Set this service as active
            serviceDiv.className =
              "flex p-2 gap-2 md:gap-3 items-center rounded-md w-56 bg-white cursor-pointer border-2 border-[#F52968] text-[#F52968] text-xs md:text-base";
        
            // Fetch categories for the selected service
            getCategories(service.id);
          });

        serviceDiv.innerHTML = `
                    <img src="${service.icon}" class="rounded-md w-[38px] h-[38px] md:w-[76px] md:h-[76px]" />
                    <p class="font-semibold">${service.name}</p>
                `;

        servicesContainer.appendChild(serviceDiv);
      });
    }
  };
  xmlhttp.open("GET", "backend/api/service.php", true);
  xmlhttp.send();
}
