;;  Emacsの本体設定
;;  Emacslispで書かれています
;;  行頭に「;」を付けるとon/offを切り替えられます

;; 日本語の設定（UTF-8）

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;;;; 種々雑多な設定
;; Official Emacs 用の設定（inline_patch をあててあります）
; (setq def ault-input-method "MacOSX")

;; バックアップファイルを作らないようにする
(setq make-backup-files nil)

;; 括弧の対応関係をハイライト表示
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(setq show-paren-style 'expression)
(setq show-paren-style 'mixed)

;; ツールバーを表示しないようにする（Official Emacs の場合は 0）
;(tool-bar-mode 0)

;; スタートアップ画面を表示しないようにする
(setq inhibit-startup-message t)

;; ウィンドウ（フレーム）のサイズ設定する
; (setq default-frame-alist
; '((width . 100) (height . 60))

;; 1行づつスクロールする
(setq scroll-conservatively 1)

;; 予約語を色分けする
(global-font-lock-mode t)

;; リージョンを強調表示
(transient-mark-mode t)
(set-face-background 'region "color-52")

;; カーソル位置を記憶
(require 'saveplace)
(save-place-mode t)

;; モードライン（アクティブでないバッファ）の文字色を設定します。
;(set-face-foreground 'mode-line-inactive "color-250")

;; モードライン（アクティブでないバッファ）の背景色を設定します。
;(set-face-background 'mode-line-inactive "color-236")

;; ウインドウ分割時に画面外へ出る文章を折り返す
(setq truncate-partial-width-windows nil) 

;; 最後の行に新しい行を作らない
(setq require-final-newlines nil)

;; MELPAとMarmaladeを追加
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(fset 'package-desc-vers 'package--ac-desc-version)

;; bufferの先頭でカーソルを戻そうとしても音をならなくする
(defun previous-line (arg)
  (interactive "p")
  (condition-case nil
      (line-move (- arg))
    (beginning-of-buffer)))

;; bufferの最後でカーソルを動かそうとしても音をならなくする
(defun next-line (arg)
  (interactive "p")
  (condition-case nil
      (line-move arg)
    (end-of-buffer)))

;; 現在行に色をつける
(global-hl-line-mode t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "color-234")))))

;; タブと行末スペースを可視化
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         ;tabs           ; タブ
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))
(setq whitespace-display-mappings
      '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
(global-whitespace-mode 1)

;; タブ文字ではなくスペースを使う
(setq-default indent-tabs-mode nil)

;; タブ幅をスペース2つ分にする
(setq-default tab-width 2)

;; 行番号を表示
(global-linum-mode t)

;; ミニバッファに行番号を表示
(line-number-mode t)

;; ミニバッファに桁番号を表示
(column-number-mode t)

;; ミニバッファに時計を表示
(display-time)

 ;; png, jpg などのファイルを画像として表示
(setq auto-image-file-mode t)

;; メニューバーを消す
(unless window-system (menu-bar-mode 0))

; ヘッダファイル(.h)をc++モードで開く
(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode))
              auto-mode-alist))

;; go-modeのとき保存時にgo fmtを実行
(add-hook 'before-save-hook 'gofmt-before-save)

;; バッファ一覧をuで更新できるようにする
(add-hook 'Buffer-menu-mode-hook
          '(lambda ()
             (define-key Buffer-menu-mode-map "u" 'list-buffers)))

;; C-hでバックスペースを入力できるようにする
(keyboard-translate ?\C-h ?\C-?)

;; キーの設定（ある程度 Mac 標準に準拠させる）
;(setq mac-command-key-is-meta nil)
;(setq mac-option-modifier 'meta)
;(setq mac-command-modifier 'super)
;(global-set-key [?\s-c] 'kill-ring-save)
;(global-set-key [?\s-v] 'yank)
;(global-set-key [?\s-x] 'kill-region)
;(global-set-key [?\s-z] 'undo)
;(global-set-key [?\s-s] 'save-buffer)
;(global-set-key [?\s-q] 'save-buffers-kill-terminal)
;(global-set-key [?\s-f] 'isearch-forward)
;(global-set-key [?\s-g] 'isearch-repeat-forward)
;(global-set-key "\C-h" 'delete-backward-char)
;(global-set-key "\M-h" 'help)


;; フォントの設定
;; 出典：http://sakito.jp/emacs/emacs23.html
;(create-fontset-from-ascii-font "Menlo-12:weight=normal:slant=normal" nil "menlokakugo")
;(set-fontset-font "fontset-menlokakugo"
;	'unicode
;	(font-spec :family "Hiragino Kaku Gothic ProN" :size 14)
;	nil
;	'append)
					;(add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))


;;;;;;;;;;;;; navi2chの設定 ;;;;;;;;;;;;;
;; コマンドを設定
(require 'navi2ch)
;; レスを全て表示する
; 既存スレ
(setq navi2ch-article-exist-message-range '(1 . 1000))
; 新スレ
(setq navi2ch-article-new-message-range '(1000 . 1))
;; Boardモードのレス数欄にレスの増加数を表示する
(setq navi2ch-board-insert-subject-with-diff t)
;; Boardモードのレス数欄にレスの未読数を表示する
(setq navi2ch-board-insert-subject-with-unread t)
;; 板一覧のカテゴリをデフォルトですべて開いて表示する
(setq navi2ch-list-init-open-category t)
;; スレを削除しない
(setq navi2ch-board-expire-date 0)
;; 履歴の行数を制限しない
(setq navi2ch-history-max-line 0)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;; flymakeの設定 ;;;;;;;;;;;;;
;; (require 'flymake)

;; (defun flymake-cc-init ()
;;   (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;          (local-file  (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;     (list "g++-7" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

;; (push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)

;; (add-hook 'c++-mode-hook
;;           '(lambda ()
;;              (flymake-mode t)))
;; (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
;;   (setq flymake-check-was-interrupted t))
;; (ad-activate 'flymake-post-syntax-check)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;; flycheckの設定 ;;;;;;;;;;;;;
(add-hook 'c++-mode 'flycheck-mode)
(add-hook 'go-mode 'flycheck-mode)
(add-hook 'csharp-mode 'flycheck-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-disabled-checkers '(c/c++-clang))
(setq flycheck-enabled-checkers '(c/c++-gcc))

;; インクルードパスの設定
(setq flycheck-gcc-include-path '("/Users/fujitashumon/devkitPro/libgba/include"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;; companyの設定 ;;;;;;;;;;;;;
(add-hook 'go-mode 'company-mode)
(add-hook 'c++-mode 'company-mode)
(add-hook 'csharp-mode 'company-mode)
(when (locate-library "company")
  (global-company-mode 1)
  (global-set-key (kbd "M-i") 'company-complete)
  ;; (setq company-idle-delay nil) ; 自動補完しない
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "<tab>") 'company-complete-selection))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; wasdでカーソル移動する
;(global-set-key "\C-w" 'nil)
;(global-set-key "\C-w" 'previous-line)
;(global-set-key "\C-a" 'nil)
;(global-set-key "\C-a" 'backward-char)
;(global-set-key "\C-s" 'nil)
;(global-set-key "\C-s" 'next-line)
;(global-set-key "\C-d" 'nil)
;(global-set-key "\C-d" 'forward-char)

;;;;;;;;;;;; web-modeの設定 ;;;;;;;;;;;;;
(setq load-path(cons "~/.emacs.d/elisp" load-path))
(require 'web-mode)
;;; 適用する拡張子
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))

;;; インデント幅
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   4)
  (setq web-mode-css-offset    4)
  (setq web-mode-script-offset 4)
  (setq web-mode-php-offset    4)
  (setq web-mode-java-offset   4)
  (setq web-mode-asp-offset    4))
(add-hook 'web-mode-hook 'web-mode-hook)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;; cmake-modeの設定 ;;;;;;;;;;;;
(require 'cmake-mode)
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;; yasnippetの設定 ;;;;;;;;;;;;
;; 自分用・追加用テンプレート -> mysnippetに作成したテンプレートが格納される
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/yasnippet-snippets/snippets"
	"~/.emacs.d/mysnippets"
	))

;(yas-global-mode 1)
;(add-to-list 'load-path
;             (expand-file-name "~/.emacs.d/elpa/yasnippet-0.12.2/"))
(eval-after-load "yasnippet"
  '(progn
     ;; companyと競合するのでyasnippetのフィールド移動は "C-i" のみにする
     (define-key yas-keymap (kbd "<tab>") nil)
     (yas-global-mode 1)))

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)
;; スニペットを再読み込み
(define-key yas-minor-mode-map (kbd "C-x i r") 'yas-reload-all)
;; 使えるスニペットの一覧を表示
(define-key yas-minor-mode-map (kbd "C-x i l") 'yas-describe-tables)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;; ediffの設定 ;;;;;;;;;;;;;;
;; 常にgit-gutter-modeにする
(global-git-gutter-mode t)
;; diff表示の自動更新

;; コントロール用のバッファを同一フレーム内に表示
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; diffのバッファを上下ではなく左右に並べる
(setq ediff-split-window-function 'split-window-horizontally)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;; Git-gutterの設定 ;;;;;;;;;;;
(set-face-background 'git-gutter:added  "green")
(set-face-background 'git-gutter:deleted  "red")
(set-face-background 'git-gutter:modified "magenta")
(require 'smartrep)
(declare-function smartrep-define-key "smartrep")
(smartrep-define-key
    global-map  "C-x" '(("p" . 'git-gutter:previous-hunk)
                        ("n" . 'git-gutter:next-hunk)))

;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(package-selected-packages (quote (yasnippet smartrep git-gutter))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (json-mode company-go package company helm yasnippet smartrep pos-tip irony git-gutter flycheck))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;; ironyの設定 ;;;;;;;;;;;;;;
(eval-after-load "irony"
  '(progn
     (custom-set-variables '(irony-additional-clang-options '("-std=c++11")))
     (add-to-list 'company-backends 'company-irony)
     (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
     (add-hook 'c-mode-common-hook 'irony-mode)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
