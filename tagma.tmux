################################################################################
#                                                                              #
#   guezwhoz.tmux — тёмная тема для tmux                                       #
#   Палитра: глубокий космос + холодный синий акцент                           #
#                                                                              #
#   Установка:                                                                 #
#     source-file /путь/до/guezwhoz.tmux                                       #
#                                                                              #
#   Пользовательские опции (задайте в ~/.tmux.conf до source-file):            #
#     @gz_status_position  top | bottom   положение статус-бара                  #
#     @gz_transparent      on  | off      прозрачный фон статус-бара            #
#     @gz_powerline        on  | off      стрелки-разделители                   #
#                                                                              #
#   Цвета можно переопределить до подключения темы:                             #
#     set -g @gz_bg          "#0b0e14"                                          #
#     set -g @gz_accent      "#82aaff"                                          #
#     ...                                                                       #
#                                                                              #
################################################################################

# ──────────────────────────────────────────────────────────────────────────────
# 1. Палитра по умолчанию
# ──────────────────────────────────────────────────────────────────────────────

if-shell -F "#{==:#{@gz_bg},}"          'set -g @gz_bg          "#0b0e14"'
if-shell -F "#{==:#{@gz_surface},}"     'set -g @gz_surface     "#151a24"'
if-shell -F "#{==:#{@gz_surface_alt},}" 'set -g @gz_surface_alt "#1f2633"'
if-shell -F "#{==:#{@gz_border},}"      'set -g @gz_border      "#242b3a"'
if-shell -F "#{==:#{@gz_fg},}"          'set -g @gz_fg          "#c8d3f5"'
if-shell -F "#{==:#{@gz_muted},}"       'set -g @gz_muted       "#6c7086"'
if-shell -F "#{==:#{@gz_accent},}"      'set -g @gz_accent      "#82aaff"'
if-shell -F "#{==:#{@gz_accent_alt},}"  'set -g @gz_accent_alt  "#c099ff"'
if-shell -F "#{==:#{@gz_green},}"       'set -g @gz_green       "#a6e3a1"'
if-shell -F "#{==:#{@gz_yellow},}"      'set -g @gz_yellow      "#ffd580"'
if-shell -F "#{==:#{@gz_red},}"         'set -g @gz_red         "#ff757f"'
if-shell -F "#{==:#{@gz_cyan},}"        'set -g @gz_cyan        "#65d1d6"'
if-shell -F "#{==:#{@gz_orange},}"      'set -g @gz_orange      "#ff9e64"'

# ──────────────────────────────────────────────────────────────────────────────
# 2. Пользовательские переключатели
# ──────────────────────────────────────────────────────────────────────────────

# Положение статус-бара
if-shell -F "#{==:#{@gz_status_position},top}" \
  'set -g status-position top' \
  'set -g status-position bottom'

# Прозрачность статус-бара.
# @gz_status_bg — внутренняя переменная: фон статус-бара и окон.
if-shell -F "#{==:#{@gz_transparent},on}" \
  'set -g @gz_status_bg "default"' \
  'set -gF @gz_status_bg "#{@gz_bg}"'

# Powerline-разделители
if-shell -F "#{==:#{@gz_powerline},off}" \
  'set -g @gz_sep_right " "' \
  'set -g @gz_sep_right ""'

# ──────────────────────────────────────────────────────────────────────────────
# 3. Базовое оформление
# ──────────────────────────────────────────────────────────────────────────────

set -gF status-style "bg=#{@gz_status_bg},fg=#{@gz_fg}"
set -g status-justify left
set -g status-left-length 70
set -g status-right-length 70
set -g status-interval 5
set -g window-status-separator ""

# ──────────────────────────────────────────────────────────────────────────────
# 4. Левая часть статус-бара: сессия, prefix, zoom
# ──────────────────────────────────────────────────────────────────────────────

set -g status-left \
  "#[fg=#{@gz_bg},bg=#{@gz_accent_alt},bold] #S \
#[fg=#{@gz_accent_alt},bg=#{@gz_status_bg},nobold]#{@gz_sep_right}\
#[fg=#{@gz_fg},bg=#{@gz_status_bg}]\
#{?client_prefix,#[fg=#{@gz_bg}]#[bg=#{@gz_yellow}]#[bold] PREFIX \
#[fg=#{@gz_yellow}]#[bg=#{@gz_status_bg}]#[nobold]#{@gz_sep_right}#[fg=#{@gz_fg}]#[bg=#{@gz_status_bg}],}\
#{?window_zoomed_flag,#[fg=#{@gz_bg}]#[bg=#{@gz_cyan}]#[bold] Z \
#[fg=#{@gz_cyan}]#[bg=#{@gz_status_bg}]#[nobold]#{@gz_sep_right}#[fg=#{@gz_fg}]#[bg=#{@gz_status_bg}],} "

# ──────────────────────────────────────────────────────────────────────────────
# 5. Список окон
# ──────────────────────────────────────────────────────────────────────────────

# Обычное окно
set -g window-status-format \
  "#[fg=#{@gz_muted},bg=#{@gz_status_bg}] #I:#W "

# Активное окно
set -g window-status-current-format \
  "#[fg=#{@gz_bg},bg=#{@gz_accent},bold] #I:#W \
#[fg=#{@gz_accent},bg=#{@gz_status_bg},nobold]#{@gz_sep_right}\
#[fg=#{@gz_fg},bg=#{@gz_status_bg}] "

# События окна
set -gF window-status-activity-style "fg=#{@gz_yellow},bg=#{@gz_status_bg},bold"
set -gF window-status-bell-style     "fg=#{@gz_red},bg=#{@gz_status_bg},bold"
set -gqF window-status-last-style    "fg=#{@gz_accent},bg=#{@gz_status_bg},bold"

# ──────────────────────────────────────────────────────────────────────────────
# 6. Правая часть статус-бара: хост, дата, время
# ──────────────────────────────────────────────────────────────────────────────

set -g status-right \
  "#[fg=#{@gz_muted},bg=#{@gz_status_bg}] #H \
#[fg=#{@gz_accent},bg=#{@gz_status_bg}] %d %b \
#[fg=#{@gz_accent_alt},bg=#{@gz_status_bg}] %H:%M "

# ──────────────────────────────────────────────────────────────────────────────
# 7. Окна, панели, режимы, сообщения
# ──────────────────────────────────────────────────────────────────────────────

# Границы панелей
set -gF pane-border-style        "fg=#{@gz_border}"
set -gF pane-active-border-style "fg=#{@gz_accent}"
set -gq pane-border-lines single

# Выбор панели (prefix + q)
set -gF display-panes-colour        "#{@gz_border}"
set -gF display-panes-active-colour "#{@gz_accent}"

# Режим копирования
setw -gF mode-style                   "bg=#{@gz_accent},fg=#{@gz_bg}"
setw -gqF copy-mode-match-style        "bg=#{@gz_surface_alt},fg=#{@gz_yellow}"
setw -gqF copy-mode-current-match-style "bg=#{@gz_yellow},fg=#{@gz_bg}"
setw -gqF copy-mode-mark-style         "bg=#{@gz_red},fg=#{@gz_bg}"

# Сообщения tmux
set -gF message-style         "bg=#{@gz_surface},fg=#{@gz_fg},fill=#{@gz_surface}"
set -gF message-command-style "bg=#{@gz_surface},fg=#{@gz_accent},fill=#{@gz_surface}"

# Часы (prefix + t)
set -gF clock-mode-colour "#{@gz_accent}"
set -g clock-mode-style 24

# Всплывающие меню (tmux 3.2+)
set -gqF menu-style              "bg=#{@gz_surface},fg=#{@gz_fg}"
set -gqF menu-selected-style     "bg=#{@gz_accent},fg=#{@gz_bg}"
set -gqF menu-border-style       "fg=#{@gz_border},bg=#{@gz_surface}"
set -gqF popup-style             "bg=#{@gz_surface},fg=#{@gz_fg}"
set -gqF popup-border-style      "fg=#{@gz_accent},bg=#{@gz_surface}"

# ──────────────────────────────────────────────────────────────────────────────
# 8. Приятные мелочи
# ──────────────────────────────────────────────────────────────────────────────

set -g focus-events on
set -g set-clipboard on
set -g history-limit 50000
