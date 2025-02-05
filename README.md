# AD-Users-Computers-ImportExport
Імпорт/експорт користувачів та комп’ютерів домену Windows Server разом з хешами. (Import/export of users and computers of Windows Server domain with hash)


Для експорту користувачів та комп'ютерів домену використовується скрипт `export_users_and_PCs.ps1`
Для імпорту користувачів та комп'ютерів домену використовується скрипт `import_users_and_PCs.ps1`

Для роботи цих скриптів потрібен модуль DSInternals (https://github.com/MichaelGrafnetter/DSInternals).
Для встановлення модуля DSInterlas в список доступних модулів PowerShell на Windows Server, можна скористатися двома варіантами: з доступом до інтернету та без доступу до інтернету.
### Варіант 1: З доступом до інтернету

    Відкрийте PowerShell з правами адміністратора:
        Натисніть Win + X і виберіть Windows PowerShell (Admin).

    Встановіть модуль з PowerShell Gallery:
        Виконайте наступну команду для встановлення модуля DSInternals:

`Install-Module -Name DSInternals -Scope CurrentUse`

Якщо ви хочете встановити модуль для всіх користувачів на сервері, використовуйте:

    `Install-Module -Name DSInternals -Scope AllUsers`

Перевірте встановлення:

    Перевірте, чи модуль встановлено правильно, виконавши:

        `Get-Module -ListAvailable -Name DSInternals`

### Варіант 2: Без доступу до інтернету

    Для завантаження модуля виконайте наступну команду в PowerShell під адміністратором на комп'ютері який має доступ до інтернету:

    `Save-Module -Name DSInternals -Path C:\Path\To\Save`

Перенесіть модуль на Windows Server:

    Скопіюйте завантажену папку з модулем (наприклад, C:\Path\To\Save\DSInternals) на ваш Windows Server.

Встановіть модуль на Windows Server:

    В PowerShell виконайте наступну команду для встановлення модуля з локальної папки:

`Install-Module -Name C:\Path\To\Save\DSInternals -Scope CurrentUser`

Якщо ви хочете встановити модуль для всіх користувачів на сервері, використовуйте:

    `Install-Module -Name C:\Path\To\Save\DSInternals -Scope AllUsers`

Перевірте встановлення:

    `Get-Module -ListAvailable -Name DSInternals`
