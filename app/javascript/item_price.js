window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
    const addTaxValue = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = addTaxValue
    profitDom.innerHTML = (inputValue - addTaxValue)
  });
});
