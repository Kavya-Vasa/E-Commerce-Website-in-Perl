const priceField = document.getElementById('price');
const quantityField = document.getElementById('quantity');
const totalPriceField = document.getElementById('total_price');

quantityField.addEventListener('keyup', (event) => {
  const price = priceField.value * 1;
  const quantity = Math.abs(quantityField.value * 1);

  const totalPrice = price * quantity;
  totalPriceField.value = totalPrice;
  console.log(price, quantity, totalPrice);
});
