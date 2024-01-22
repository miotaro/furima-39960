window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = Math.floor(inputValue * 0.1);
    const addTaxDomElement = document.getElementById("add-tax-price");
    addTaxDomElement.textContent = addTaxDom;

    const salesProfit = Math.floor(inputValue * 0.9);
    const salesProfitElement = document.getElementById("profit");
    salesProfitElement.textContent = salesProfit;
  });
});