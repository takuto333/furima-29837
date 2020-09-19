function tax() {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  itemPrice.addEventListener("keyup", () => {
    const price = itemPrice.value;
    if (price >= 300 && price <= 9999999){
    let fee = price * 0.1;
    let salesProfit = price - fee;
    addTaxPrice.textContent = Math.floor(fee);
    profit.textContent = Math.floor(salesProfit);
    } else {
      let fee = 0
      let salesProfit = 0
      addTaxPrice.textContent = fee;
      profit.textContent = salesProfit;
    };
  });
};

setInterval(tax, 1000);
