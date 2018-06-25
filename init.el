(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; パッケージ情報の更新
;;新しくパッケージをインストールするときのみコメントアウト
;;(package-refresh-contents)

;; インストールするパッケージ
(defvar my/favorite-packages
  '(
    ;;;; auto-complete
    auto-complete

    ;;;; smartparens
    smartparens
    
    ;;;; git
    git-gutter
    )
)

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; テーマ
(load-theme 'tango-dark t)

;; 環境を日本語、UTF-8にする
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; スタートアップメッセージを表示させない
(setq inhibit-startup-message t)

;; バックアップファイルを作成させない
(setq make-backup-files nil)

;; 終了時にオートセーブファイルを削除する
(setq delete-auto-save-files t)

;; "yes or no" の選択を "y or n" にする
(fset 'yes-or-no-p 'y-or-n-p)

;; タブ文字ではなくスペースを使う
;(setq-default tab-width 4 indent-tabs-mode nil)
(setq-default c-basic-offset 4     ;;基本インデント量4
              tab-width 4          ;;タブ幅4
              indent-tabs-mode nil)

;; 列数を表示する
(column-number-mode t)
;; 行数を表示する
(global-linum-mode t)
(setq linum-format "%4d| ")

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; 現在行をハイライト
(global-hl-line-mode t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "color245")))))

;; C-k で行末の改行も消去
(setq kill-whole-line t)

;; シフト＋矢印で範囲選択
(setq pc-select-selection-keys-only t)

;; beep音を消す
(defun my-bell-function ()
  (unless (memq this-command
      '(isearch-abort abort-recursive-edit exit-minibuffer
	   keyboard-quit mwheel-scroll down up next-line previous-line
	      backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)

;; auto-complete
(global-auto-complete-mode t)

;; smartparens
(smartparens-global-mode t)

;; git
(global-git-gutter-mode t)
