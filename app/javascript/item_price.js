window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
    const addTax = inputValue * 0.1
    addTaxDom.innerHTML = Math.floor(addTax)
    profitDom.innerHTML = Math.floor(inputValue - addTax)
  })
});
