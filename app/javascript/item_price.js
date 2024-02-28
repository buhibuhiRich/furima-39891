const priceInput = document.getElementById("item-price");
const commissionDisplay = document.getElementById('add-tax-price');
const profitDisplay = document.getElementById('profit');

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  
  if (isNaN(inputValue)) {
    // 金額が数字でない場合の処理
    commissionDisplay.textContent = 'エラー';
    profitDisplay.textContent = 'エラー';
    return;
  }

  // 販売手数料の計算
  const commission = Math.floor(inputValue * 0.1);
  commissionDisplay.textContent = `¥${commission.toLocaleString()}`;

  // 販売利益の計算
  const profit = Math.floor(inputValue - commission);
  profitDisplay.textContent = `¥${profit.toLocaleString()}`;
});






