# zdorovklimat — stage

Стейдж-копия сайта zdorovklimat.com.ua (MODX Revolution 2.5.7, miniShop2, Babel: UA + RU).

- Стейдж: https://zdorovklimat-stage.touchit.vinnica.ua/
- Папка на сервере: `/home/ti061721/touchit.vinnica.ua/zdorovklimat-stage/`
- Менеджер: `/impulsemanager/`
- Префикс таблиц: `Impulse_Digital_X_`

## Что не хранится в git

| Что | Почему |
|---|---|
| `core/config/config.inc.php`, `config.core.php`, `connectors/config.core.php`, `impulsemanager/config.core.php` | у каждого окружения свои пути и доступы к БД — кладутся на сервер вручную |
| `rest.php` | содержит доступы к Bitrix24 CRM (репозиторий публичный) |
| `assets/images/` и прочие загрузки | фото переносятся отдельно |
| `core/cache/` | кэш MODX, создаётся сам |

## Деплой на стейдж

1. `git pull` в папке сайта.
2. Если менялась база — импортировать выданный дамп.
3. Очистить кэш: удалить содержимое `core/cache/` (или «Обновить сайт» в менеджере).

## PHP

MODX 2.5.7 не работает на PHP 8+. На хостинге нужен PHP 7.x (локально проверено на 7.4).
