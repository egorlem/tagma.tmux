# Tagma [ˈtaɣma] — tmux theme

<!-- # guezwhoz.tmux

Тёмная тема для tmux: глубокий графитовый фон, холодные синие акценты,
аккуратный статус-бар и читаемый список окон.

## Скриншоты

![Статус-бар](screenshots/status-bar.png)

![Выбор сессии](screenshots/session-chooser.png)

## Возможности

- тёмная палитра;
- аккуратные границы панелей;
- статус-бар с именем сессии, списком окон, hostname, датой и временем;
- индикаторы `PREFIX` и `ZOOM`;
- отдельные стили для копирования, сообщений, меню и часов;
- поддержка прозрачного фона статус-бара;
- переключатель Powerline-разделителей.

## Требования

- tmux **3.2+** (проверено на tmux 3.7);
- терминал с поддержкой 256 цветов или true color;
- для стрелок `` желателен Powerline/Nerd Font. Если шрифта нет,
  отключите стрелки опцией `@gz_powerline off`.

## Установка

### Вариант 1. Локально

Скопируйте тему в удобное место, например в `~/.config/tmux/`:

```sh
mkdir -p ~/.config/tmux
cp guezwhoz.tmux ~/.config/tmux/guezwhoz.tmux
```

Затем добавьте в `~/.tmux.conf` или `~/.config/tmux/tmux.conf`:

```tmux
source-file ~/.config/tmux/guezwhoz.tmux
```

Перезагрузите конфиг:

```sh
tmux source-file ~/.tmux.conf
# или, если используете XDG-путь:
# tmux source-file ~/.config/tmux/tmux.conf
```

### Вариант 2. Как TPM-плагин

Если папка с темой уже лежит в `~/.tmux/plugins/tmux-guezwhoz`, добавьте в
`~/.tmux.conf`:

```tmux
set -g @plugin 'guezwhoz/tmux-guezwhoz'
```

или просто подключите файл напрямую:

```tmux
run '~/.tmux/plugins/tmux-guezwhoz/guezwhoz.tmux'
```

## Настройка

Все опции нужно задавать **до** подключения темы.

```tmux
# Положение статус-бара: bottom (по умолчанию) или top
set -g @gz_status_position 'top'

# Прозрачный фон статус-бара: on | off
set -g @gz_transparent 'on'

# Powerline-стрелки: on (по умолчанию) | off
set -g @gz_powerline 'off'

source-file ~/.config/tmux/guezwhoz.tmux
```

### Своя палитра

Цвета можно переопределить перед подключением темы:

```tmux
set -g @gz_bg          '#11111b'
set -g @gz_surface     '#181825'
set -g @gz_surface_alt '#1e1e2e'
set -g @gz_border      '#313244'
set -g @gz_fg          '#cdd6f4'
set -g @gz_muted       '#7f849c'
set -g @gz_accent      '#89b4fa'
set -g @gz_accent_alt  '#cba6f7'
set -g @gz_green       '#a6e3a1'
set -g @gz_yellow      '#f9e2af'
set -g @gz_red         '#f38ba8'
set -g @gz_cyan        '#94e2d5'
set -g @gz_orange      '#fab387'

source-file ~/.config/tmux/guezwhoz.tmux
```

## Палитра по умолчанию

| Опция | Цвет | Назначение |
| --- | --- | --- |
| `@gz_bg` | `#0b0e14` | основной фон |
| `@gz_surface` | `#151a24` | поверхности, сообщения |
| `@gz_surface_alt` | `#1f2633` | выделенные поверхности |
| `@gz_border` | `#242b3a` | неактивные границы |
| `@gz_fg` | `#c8d3f5` | основной текст |
| `@gz_muted` | `#6c7086` | приглушённый текст |
| `@gz_accent` | `#82aaff` | основной акцент |
| `@gz_accent_alt` | `#c099ff` | второй акцент |
| `@gz_green` | `#a6e3a1` | успех |
| `@gz_yellow` | `#ffd580` | предупреждение, prefix |
| `@gz_red` | `#ff757f` | ошибка, bell |
| `@gz_cyan` | `#65d1d6` | zoom |
| `@gz_orange` | `#ff9e64` | дополнительный акцент |

## Полезные команды

```sh
# применить изменения в конфиге
tmux source-file ~/.tmux.conf

# посмотреть установленные значения
tmux show-options -g | grep '@gz_'

# проверить поддержку цвета в терминале
tmux info | grep -Ei 'RGB|Tc'
```

## Лицензия

MIT

Готовый пример конфига лежит в `examples/tmux.conf`.

Скриншоты можно перегенерировать командой:

```sh
python3 screenshots/generate_screenshots.py
``` -->
