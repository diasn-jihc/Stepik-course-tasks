function submitChangeColor() {
    var changeColor = document.getElementById('bodyColor');
    if (!changeColor) return;
    changeColor.setAttribute('style', 'background:blue');
    var resultMessage = document.getElementById('resultMessage');
    if (resultMessage) resultMessage.textContent = 'Color changed to blue';
    MyJSChannel.postMessage('Hello Flutter from Javascript');
}
function resetPage() {
    var changeColor = document.getElementById('bodyColor');
    var resultMessage = document.getElementById('resultMessage');
    if (!changeColor) return;
    changeColor.style.backgroundColor = 'black';
    if (resultMessage) resultMessage.textContent = 'Color reset';
}

function sendOK() {
    var changeColor = document.getElementById('bodyColor');
    changeColor.setAttribute('style', 'background:black');
}