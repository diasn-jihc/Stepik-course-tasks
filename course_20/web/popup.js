(() => {
  'use strict';

  const STORAGE_KEY = 'qrText';
  const ECC_KEY = 'qrEcc';
  const SIZE = 240;        // CSS px
  const QUIET = 2;         // quiet zone, in modules
  const DARK = '#0b0f1a';  // QR module colour
  const LIGHT = '#ffffff'; // QR background colour

  const $ = (id) => document.getElementById(id);
  const textEl = $('text');
  const eccEl = $('ecc');
  const canvas = $('canvas');
  const plate = document.querySelector('.plate');
  const statusEl = $('status');
  const copyBtn = $('copy');
  const downloadBtn = $('download');
  const ctx = canvas.getContext('2d');

  let statusTimer = null;

  // ---------- helpers ----------

  function setStatus(msg, kind = '', autoClear = false) {
    statusEl.textContent = msg;
    statusEl.className = 'status ' + kind;
    clearTimeout(statusTimer);
    if (autoClear) {
      statusTimer = setTimeout(() => setStatus(''), 1800);
    }
  }

  // qr.js writes one char code per byte, so convert text to UTF-8 first.
  // This keeps Kazakh / Cyrillic letters and emoji scannable.
  function toUtf8Binary(str) {
    return unescape(encodeURIComponent(str));
  }

  function drawQr(text, eccLetter) {
    const qr = new QRCodeLib(-1, QRCodeLib.ECC[eccLetter]);
    qr.addData(toUtf8Binary(text));
    qr.make();

    const count = qr.getModuleCount();
    const total = count + QUIET * 2;
    const dpr = window.devicePixelRatio || 1;
    const px = Math.floor((SIZE * dpr) / total) * total; // integer pixels per module
    canvas.width = px;
    canvas.height = px;

    const cell = px / total;
    ctx.fillStyle = LIGHT;
    ctx.fillRect(0, 0, px, px);
    ctx.fillStyle = DARK;
    for (let r = 0; r < count; r++) {
      for (let c = 0; c < count; c++) {
        if (qr.isDark(r, c)) {
          ctx.fillRect((c + QUIET) * cell, (r + QUIET) * cell, cell, cell);
        }
      }
    }
  }

  function render() {
    const text = textEl.value;
    if (!text.trim()) {
      plate.classList.remove('has-qr');
      copyBtn.disabled = true;
      downloadBtn.disabled = true;
      setStatus('');
      return;
    }
    try {
      drawQr(text, eccEl.value);
      plate.classList.add('has-qr');
      copyBtn.disabled = false;
      downloadBtn.disabled = false;
      setStatus('');
    } catch (err) {
      plate.classList.remove('has-qr');
      copyBtn.disabled = true;
      downloadBtn.disabled = true;
      setStatus('Мәтін тым ұзын. Қысқартыңыз немесе деңгейді L қылыңыз.', 'error');
    }
  }

  function save() {
    chrome.storage.local.set({
      [STORAGE_KEY]: textEl.value,
      [ECC_KEY]: eccEl.value,
    });
  }

  // ---------- events ----------

  textEl.addEventListener('input', () => {
    save();
    render();
  });

  eccEl.addEventListener('change', () => {
    save();
    render();
  });

  $('clear').addEventListener('click', () => {
    textEl.value = '';
    save();
    render();
    textEl.focus();
  });

  $('useTab').addEventListener('click', async () => {
    try {
      const [tab] = await chrome.tabs.query({ active: true, currentWindow: true });
      if (tab && tab.url) {
        textEl.value = tab.url;
        save();
        render();
      } else {
        setStatus('Бет сілтемесін алу мүмкін болмады', 'error', true);
      }
    } catch (e) {
      setStatus('Бет сілтемесін алу мүмкін болмады', 'error', true);
    }
  });

  downloadBtn.addEventListener('click', () => {
    const a = document.createElement('a');
    a.href = canvas.toDataURL('image/png');
    a.download = 'qr-code.png';
    a.click();
    setStatus('Жүктелді', 'ok', true);
  });

  copyBtn.addEventListener('click', async () => {
    try {
      const blob = await new Promise((resolve) => canvas.toBlob(resolve, 'image/png'));
      await navigator.clipboard.write([new ClipboardItem({ 'image/png': blob })]);
      setStatus('Көшірілді', 'ok', true);
    } catch (e) {
      setStatus('Көшіру мүмкін болмады, PNG жүктеңіз', 'error', true);
    }
  });

  // ---------- init ----------

  chrome.storage.local.get([STORAGE_KEY, ECC_KEY], (res) => {
    textEl.value = res[STORAGE_KEY] || '';
    if (res[ECC_KEY]) eccEl.value = res[ECC_KEY];
    render();
    textEl.focus();
  });
})();
