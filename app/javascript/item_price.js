
const pay = () => {
const priceInput = document.getElementById("item-price");
const commissionDisplay = document.getElementById('add-tax-price');
const profitDisplay = document.getElementById('profit');

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  
  if (isNaN(inputValue)) {
    commissionDisplay.textContent = 'エラー';
    profitDisplay.textContent = 'エラー';
    return;
  }
  
  const commission = Math.floor(inputValue * 0.1);
  const profit = Math.floor(inputValue - commission);
  
 
  commissionDisplay.innerHTML = `¥${commission.toLocaleString()}`;
  
 
  profitDisplay.innerHTML = `¥${profit.toLocaleString()}`;
});
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);

