import { getProducts } from "./product.js";

export function getCategories(serviceId = 1) {
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {

      console.log(this.response);
      
      const data = JSON.parse(this.response);
      
      const categoryContainer = document.getElementById("categories");
      
      categoryContainer.innerHTML = "";
      
      categoryContainer.appendChild(
        addCategoryDiv(
          "./assets/images/icons/all-category.png",
          "All",
          0,
          serviceId,
          true
        )
      );

      data.data.forEach((category) => {
        categoryContainer.appendChild(
          addCategoryDiv(
            category.icon,
            category.name,
            category.id,
            serviceId,
            false
          )
        );
      });

      const slideArrow = document.createElement('div');
      slideArrow.id = 'slide_arrow';
      slideArrow.className = 'rounded-full p-2 absolute flex items-center justify-center border border-gray-200 right-0 z-10 top-1/2 transform -translate-y-1/2 bg-white shadow-xl';
      slideArrow.innerHTML = '<img src="./assets/images/icons/right-arrow.svg" width="15" height="15" />';

      slideArrow.addEventListener('click', () => {
        console.log('Slide arrow clicked');
      });
      
      categoryContainer.appendChild(slideArrow);
      
      getProducts(0, serviceId);
    }
    
    if (this.readyState == 4 && this.status == 400) {
      const categoryContainer = document.getElementById("categories");
      categoryContainer.innerHTML = "";
      getProducts(0, serviceId);
    }
  };
  xmlhttp.open("GET", "backend/api/category.php?serviceId=" + serviceId, true);
  xmlhttp.send();
}

function addCategoryDiv(icon, name, id, serviceId, isActive) {
  const categoryDiv = document.createElement("div");
  categoryDiv.className = isActive
    ? "bg-white rounded-md flex flex-col gap-2 p-2 items-center min-w-28 w-28 cursor-pointer border-2 border-[#F52968] text-[#F52968]"
    : "bg-white rounded-md flex flex-col gap-2 p-2 items-center min-w-28 w-28 cursor-pointer";

  categoryDiv.addEventListener("click", () => {
    // Remove active state from all categories
    const categories = document.querySelectorAll("#categories > div");
    categories.forEach((cat) => {
      if(cat.id!="slide_arrow")
      cat.className =
        "bg-white rounded-md flex flex-col gap-2 p-2 items-center min-w-28 w-28 cursor-pointer";
    });

    // Set this category as active
    categoryDiv.className =
      "bg-white rounded-md flex flex-col gap-2 p-2 items-center min-w-28 w-28 cursor-pointer border-2 border-[#F52968] text-[#F52968]";

    // Fetch products for the selected category
    getProducts(id, serviceId);
  });

  categoryDiv.innerHTML = `
                      <img src="${icon}" width="60" height="60" />
                    <span class="text-center font-medium text-sm">${name}</span>
                  `;

  return categoryDiv;
}
