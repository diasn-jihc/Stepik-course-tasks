function submitChangeColor() {
    var changeColor = document.getElementById('bodyColor');
    changeColor.setAttribute('style', 'background:blue');
    MyJSChannel.postMessage('Hello Flutter from Javascript');
}
function sendOK() {
    var changeColor = document.getElementById('bodyColor');
    changeColor.setAttribute('style', 'background:black');
}