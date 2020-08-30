function price() {
  const $price = document.getElementById("item-price");
  $price.addEventListener("input", () => {
    const value = $price.value
    console.log(value);
    const tax = Math.floor(value / 10)
    const profit = value - tax
    const $taxId = document.getElementById("add-tax-price")
    $taxId.textContent = tax
    const $profit = document.getElementById("profit")
    $profit.textContent = profit
  });

}
window.addEventListener("load", price);