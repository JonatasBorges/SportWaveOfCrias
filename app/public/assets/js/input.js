const form = document.querySelector('form')
const filterElement = document.querySelector('header input')
const products = document.querySelectorAll('.product-grid .product-item')
const carrosel = document.querySelector('.container-fluid')
const esporte = document.querySelector('.category')
const categorias = document.querySelector('#feature')
const border = document.querySelector('.text-destaques')

filterElement.addEventListener('input', filterProducts)


function filterProducts() {
    if (filterElement.value != '') {
        for (let product of products) {
            let title = product.querySelector('h3')
            title = title.textContent.toLocaleLowerCase()
            let filterText = filterElement.value.toLocaleLowerCase()
            if (!title.includes(filterText)) {
                product.style.display = 'none'
            }
            else {
                product.style.display = 'flex'
                carrosel.style.display = 'none'
                esporte.style.display = 'none'
                feature.style.display = 'none'
                border.style.borderTop = ' 1px solid #32D0F2'
            }
        }
    } else {
        for (let product of products) {
            product.style.display = 'flex'
        }
    }
}
