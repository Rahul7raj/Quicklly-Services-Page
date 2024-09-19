export function getProducts(catId=0,serviceId=1)
{
    console.log('get products')
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        console.log(this.response);
        const data = JSON.parse(this.response);
        
        const productContainer = document.getElementById("products");
        productContainer.innerHTML = "";

        data.data.forEach(product => {
            productContainer.innerHTML += 
            `
                <div class="max-w-sm bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700 product-item">
                    <img src="${product.image}" width="330" height="220" />
                    <div class="h-[154px] flex flex-col justify-between">
                        <p class="p-4 font-semibold product-name">${product.title}</p>
                        <div class="flex justify-between items-center bg-[#F8F8F8] p-4">
                            <span class=" font-semibold">${product.price_range}</span>
                            <button class="bg-[#F52968] text-white px-4 py-2 rounded-md">Book Now</button>
                        </div>
                    </div>
                </div>
            `; 
        }); 
      }
      if(this.readyState == 4 && this.status == 400)
        {
            const productContainer = document.getElementById("products");
            productContainer.innerHTML = "";
        }
    };
    xmlhttp.open("GET", "backend/api/product.php?catId="+catId+"&serviceId="+serviceId, true);
    xmlhttp.send();
}