function price_sum() {
    const price = document.getElementById("item-price").value
    tax_price = price * 0.1
    document.getElementById('add-tax-price').textContent = tax_price
    document.getElementById('profit').textContent = price - tax_price
}

setInterval(price_sum, 1000);