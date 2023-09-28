const buttonOpen = document.getElementById('modalOpen');
const judgeOpen = document.getElementById('judgeModalOpen');
const answerModal = document.getElementById('answerModal');
const correctModal = document.getElementById('correctModal');
const incorrectModal = document.getElementById('incorrectModal');

buttonOpen.addEventListener('click', modalOpen);
function modalOpen() {
  answerModal.style.display = 'block';
}

judgeOpen.addEventListener('click', judgeModalOpen);
async function judgeModalOpen() {
  await main();  // main関数を実行
  await run();  // run関数を実行
  const expected = document.getElementById(`output`).value.trim();
  const result = document.getElementById('answer').value.trim();
  if (expected == result) {
    correctModal.style.display = 'block';
  } else {
    incorrectModal.style.display = 'block';
  }
}

// モーダルを閉じるボタンのイベントリスナーを設定
const closeBtns = document.querySelectorAll(".modalClose");
closeBtns.forEach(btn => {
  btn.addEventListener('click', () => {
    const modal = btn.closest('.modal');
    if (modal) {
      modal.style.display = "none";
    }
  });
});

// モーダルの外側をクリックしたときにモーダルを閉じるイベントリスナーを設定
window.addEventListener('click', event => {
  if (event.target.className === "modal") {
    event.target.style.display = "none";
  }
});
