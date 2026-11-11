function submitChangeColor() {
    var changeColor = document.getElementById('bodyColor');
    if (!changeColor) return;
    changeColor.setAttribute('style', 'background:#168b7e; color:#f5fffd');
    var resultMessage = document.getElementById('resultMessage');
    if (resultMessage) resultMessage.textContent = 'Цвет фона изменён';
    MyJSChannel.postMessage('Сообщение из JavaScript');
}
function resetPage() {
    var changeColor = document.getElementById('bodyColor');
    var resultMessage = document.getElementById('resultMessage');
    if (!changeColor) return;
    changeColor.style.backgroundColor = '#0b1715';
    changeColor.style.color = '#e8f4f1';
    if (resultMessage) resultMessage.textContent = 'Исходный цвет восстановлен';
}

function sendOK() {
    var changeColor = document.getElementById('bodyColor');
    if (!changeColor) return;
    changeColor.setAttribute('style', 'background:#0b1715; color:#e8f4f1');
}
