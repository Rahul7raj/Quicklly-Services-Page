import {getServices} from './ajax/service.js'
import { getCategories } from './ajax/category.js';

$( document ).ready(function() {
    console.log( "ready!" );
    getServices();
    getCategories();

    document.getElementById('search_puja_input').addEventListener('input', () => {
        const searchValue = document.getElementById('search_puja_input').value.trim().toLowerCase();
    
        console.log(searchValue)
        // Get all product items
        const products = document.querySelectorAll('#products .product-item');
        
        products.forEach(product => {
            // Get the product name
            const productName = product.querySelector('.product-name').textContent.trim().toLowerCase();
            
            // Check if the product name includes the search value
            if (productName.includes(searchValue)) {
                product.style.display = '';
            } else {
                product.style.display = 'none';
            }
        });
    });

    document.getElementById('view_all_category').addEventListener('click', () => {
        document.getElementById('categories').classList.toggle('flex-wrap');
        document.getElementById('slide_arrow').classList.toggle('hidden')
        const span = document.getElementById('view_all_category');
        
        if(span.innerText.includes('All'))
        span.innerHTML = 
        `
            View Less <img src="./assets/images/icons/up-arrow.svg" width="15" height="15" alt="up arrow" />
        `
        else
        span.innerHTML = 
        `
            View All <img src="./assets/images/icons/down-arrow.svg" width="15" height="15" alt="down arrow" />
        `
    });
});