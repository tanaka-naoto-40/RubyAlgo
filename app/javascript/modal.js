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
  await main();
  await run();
  const expected = document.getElementById(`output`).value.trim();
  const result = document.getElementById('answer').value.trim();
  const lessonId = document.getElementById('lesson-id').value.trim();

  if (expected == result) {
    correctModal.style.display = 'block';
    // AJAXリクエストを送信してProgressを記録
    recordProgress(true, lessonId);
  } else {
    incorrectModal.style.display = 'block';
    recordProgress(false, lessonId);
  }
}

function recordProgress(isCorrect, lessonId) {
  // ここでサーバーサイドのエンドポイントURLを指定
  const url = '/progresses';
  const data = {
    progress: {
      date: new Date().toISOString().slice(0, 10), // 今日の日付
      status: isCorrect ? 'correct' : 'incorrect',  // クイズの結果
      lesson_id: lessonId
    }
  };

  fetch(url, {
    method: 'POST', 
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': getCsrfToken() // CSRFトークンの取得
    },
    body: JSON.stringify(data) 
  })
  .then(response => response.json())
  .then(data => {
    console.log('Success:', data);
  })
  .catch((error) => {
    console.error('Error:', error);
  });
}

function getCsrfToken() {
  // CSRFトークンを取得するための関数
  return document.querySelector('[name="csrf-token"]').content;
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
