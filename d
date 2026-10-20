<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MD Market - AI Marketplace</title>
    <script src="https://telegram.org/js/telegram-web-app.js"></script>
    <style>
        :root {
            --tg-theme-bg-color: #1c1c1d;
            --tg-theme-text-color: #ffffff;
            --tg-theme-hint-color: #aaa;
            --accent-color: #0088cc;
            --card-bg: #2c2c2e;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            background-color: var(--tg-theme-bg-color);
            color: var(--tg-theme-text-color);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        header {
            width: 100%;
            padding: 20px;
            text-align: center;
            background: var(--card-bg);
            box-shadow: 0 2px 10px rgba(0,0,0,0.3);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .search-container {
            margin: 20px;
            width: 90%;
            display: flex;
            gap: 10px;
        }

        input {
            flex: 1;
            padding: 12px;
            border-radius: 10px;
            border: none;
            background: var(--card-bg);
            color: white;
            font-size: 16px;
        }

        .btn-ai {
            background: linear-gradient(45deg, #0088cc, #00ffcc);
            border: none;
            padding: 10px 15px;
            border-radius: 10px;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        .ads-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            padding: 10px;
            width: 95%;
        }

        .ad-card {
            background: var(--card-bg);
            border-radius: 15px;
            padding: 10px;
            text-align: center;
            transition: transform 0.2s;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
        }

        .ad-card:active {
            transform: scale(0.95);
        }

        .ad-image {
            width: 100%;
            height: 120px;
            background: #444;
            border-radius: 10px;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #888;
        }

        .ad-title {
            font-weight: bold;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .ad-price {
            color: #00ffcc;
            font-weight: bold;
            font-size: 16px;
        }

        .fab {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 60px;
            height: 60px;
            background: var(--accent-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            color: white;
            box-shadow: 0 4px 10px rgba(0,0,0,0.5);
            cursor: pointer;
        }
    </style>
</head>
<body>

    <header>
        <h2 style="margin:0">MD Market AI</h2>
        <span style="font-size: 12px; color: var(--tg-theme-hint-color)">Лучшие сделки Молдовы</span>
    </header>

    <div class="search-container">
        <input type="text" id="searchInput" placeholder="Ищу iPhone 14 за 7000...">
        <button class="btn-ai" onclick="searchAI()">AI ✨</button>
    </div>

    <div class="ads-grid" id="adsGrid">
        <!-- Сюда будут подгружаться карточки через JS -->
        <div class="ad-card">
            <div class="ad-image">Фото</div>
            <div class="ad-title">iPhone 13 Pro</div>
            <div class="ad-price">6500 MDL</div>
        </div>
        <div class="ad-card">
            <div class="ad-image">Фото</div>
            <div class="ad-title">PS5 Slim</div>
            <div class="ad-price">8000 MDL</div>
        </div>
    </div>

    <div class="fab" onclick="openAddAd()">+</div>

    <script>
        // Инициализация Telegram Web App
        const tg = window.Telegram.WebApp;
        tg.expand(); // Раскрываем приложение на весь экран

        async function searchAI() {
            const query = document.getElementById('searchInput').value;
            if(!query) return alert('Введите запрос!');

            // Тут будет запрос к нашему бэкенду
            alert('AI-агент ищет лучшие варианты по запросу: ' + query);
        }

        function openAddAd() {
            // Вызываем метод ТГ для отправки данных боту или открываем форму
            tg.sendData("open_add_ad");
        }

        // Функция для загрузки объявлений из базы (будет реализована во втором шаге)
        async function loadAds() {
            // const response = await fetch('/get_ads');
            // const ads = await response.json();
            // ... рендер карточек ...
        }

        loadAds();
    </script>
</body>
</html>
