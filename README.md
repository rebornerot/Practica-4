# Practica-4
1. ERP-системы (Enterprise Resource Planning):

– Примеры: «1С:Предприятие 8.3» (Web-клиент), SAP S/4HANA (Fiori UI), Odoo.

– Архитектура: Браузер (HTML5/WebSocket) ↔ Web-сервер (IIS/Apache/Nginx) ↔ Кластер серверов приложений ↔ Реляционная СУБД (MS SQL Server, PostgreSQL, Oracle).

– Сфера применения: Сквозное планирование ресурсов, бухучет, управление производством и цепочками поставок.

2. CRM и BPM-системы (Customer Relationship / Business Process Management):

– Примеры: Битрикс24 (Enterprise), Creatio, ELMA365.

– Архитектура: Микросервисная или гибридно-монолитная архитектура с интенсивным использованием REST/WebSocket API и фронтенд-фреймворков (Vue, React).

– Сфера применения: Автоматизация маркетинга, продаж, сквозных процессов согласования документов.

3. ITSM и Service Desk платформы:

– Примеры: Naumen Service Desk, GLPI, Jira Service Management.

– Архитектура: Трехзвенная Web-архитектура с упором на транзакционную обработку заявок и соблюдение соглашений об уровне обслуживания (SLA).

4. Простое приложение регистрации заявок (Delphi + IIS + MS SQL) Веб-приложение на Delphi (ISAPI + IIS) для регистрации пользовательских заявок с сохранением в MS SQL Server. Позволяет отправить заявку через форму и просмотреть список всех заявок в браузере.
Структура репозитория

DelphiRequestApp/ ├── Database/ │ └── CreateDatabase.sql ├── Source/ │ ├── RequestApp.dpr │ ├── RequestWebModule.pas │ └── RequestWebModule.dfm ├── README.md
