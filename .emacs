;;
(menu-bar-mode -1)
(tool-bar-mode 0)

;; Add-to-load-path                                                                                                                                                                
(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
                   (add-to-list 'load-path path))
                (mapcar 'expand-file-name paths)))
(add-to-load-path "/usr/share/emacs/site-lisp")


(setq js2-highlight-level 3)
(setq js2-basic-offset 4)
(setq js2-cleanup-whitespace nil)
(setq js2-indent-on-enter-key t)
(setq js2-rebind-eol-bol-keys nil)
(setq js2-use-font-lock-faces t)


;; ;;flymake for perl
;; ;;http://unknownplace.org/memo/2007/12/21
;; (require 'flymake)
;; (defvar flymake-perl-err-line-patterns '(("\\(.*\\) at \\([^ \n]+\\) line \\([0-9]+\\)[,.\n]" 2 3 nil 1)))
;; (defconst flymake-allowed-perl-file-name-masks '(("\\.pl$" flymake-perl-init)
;;                                                ("\\.pm$" flymake-perl-init)
;;                                                ("\\.t$" flymake-perl-init)))

;; (defun flymake-perl-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;     (list "perl" (list "-wc" local-file))))

;; (defun flymake-perl-load ()
;;   (interactive)
;;   (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
;;     (setq flymake-check-was-interrupted t))
;;   (ad-activate 'flymake-post-syntax-check)
;;   (setq flymake-allowed-file-name-masks (append flymake-allowed-file-name-masks flymake-allowed-perl-file-name-masks))
;;   (setq flymake-err-line-patterns flymake-perl-err-line-patterns)
;;   (set-perl5lib)
;;   (flymake-mode t))

;; (add-hook 'cperl-mode-hook '(lambda () (flymake-perl-load)))


;; flymake (Emacs22����ɸ��ź�դ���Ƥ���)
(require 'flymake)

;; set-perl5lib
;; ������������ץȤΥѥ��˱����ơ�@INC��lib���ɲä��Ƥ����
;; �ʲ������������ɤ���ɬ�פ���
;; http://svn.coderepos.org/share/lang/elisp/set-perl5lib/set-perl5lib.el
(require 'set-perl5lib)

;; ���顼���������˥󥰻��Υե�����
(set-face-background 'flymake-errline "red4")
(set-face-foreground 'flymake-errline "black")
(set-face-background 'flymake-warnline "yellow")
(set-face-foreground 'flymake-warnline "black")

;; ���顼��ߥ˥Хåե���ɽ��
;; http://d.hatena.ne.jp/xcezx/20080314/1205475020
(defun flymake-display-err-minibuf ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no             (flymake-current-line-no))
         (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count               (length line-err-info-list)))
    (while (> count 0)
      (when line-err-info-list
        (let* ((file       (flymake-ler-file (nth (1- count) line-err-info-list)))
               (full-file  (flymake-ler-full-file (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line       (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)))
      (setq count (1- count)))))

;; Perl������
;; http://unknownplace.org/memo/2007/12/21#e001
(defvar flymake-perl-err-line-patterns
  '(("\\(.*\\) at \\([^ \n]+\\) line \\([0-9]+\\)[,.\n]" 2 3 nil 1)))

(defconst flymake-allowed-perl-file-name-masks
  '(("\\.pl$" flymake-perl-init)
    ("\\.pm$" flymake-perl-init)
    ("\\.t$" flymake-perl-init)))

(defun flymake-perl-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "perl" (list "-wc" local-file))))

(defun flymake-perl-load ()
  (interactive)
  (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
    (setq flymake-check-was-interrupted t))
  (ad-activate 'flymake-post-syntax-check)
  (setq flymake-allowed-file-name-masks (append flymake-allowed-file-name-masks flymake-allowed-perl-file-name-masks))
  (setq flymake-err-line-patterns flymake-perl-err-line-patterns)
  (set-perl5lib)
  (flymake-mode t))

(add-hook 'cperl-mode-hook 'flymake-perl-load)


;emacs-w3m
;(require 'w3m-load)

;; �Կ�ɽ��
(line-number-mode t)
;; ���ֹ�
(column-number-mode t)

;; �������ȥ��åץڡ�����ɽ�����ʤ�
(setq inhibit-startup-message t)

;; �Хå����åץե��������ʤ�
(setq backup-inhibited t)

(when (eq window-system 'mac)
  (add-hook 'window-setup-hook
            (lambda ()
;;              (setq mac-autohide-menubar-on-maximize t)
              (set-frame-parameter nil 'fullscreen 'fullboth)
              )))


(defun mac-toggle-max-window ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (set-frame-parameter nil 'fullscreen nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)))

;; Carbon Emacs������������줿. ��˥塼�򱣤����ꡥ
(custom-set-variables
 '(display-time-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode t))
(custom-set-faces
 )

;;Color
(if window-system (progn
   (set-background-color "Black")
   (set-foreground-color "LightGray")
   (set-cursor-color "Gray")
   (set-frame-parameter nil 'alpha 75)
   ))

;; ������ɥ���Ʃ����
;(add-to-list 'default-frame-alist '(alpha . (0.85 0.85)))

;; ������ɥ�����粽
(mac-toggle-max-window)

;; �����ɽ��
(setq display-time-day-and-date t)
(display-time)

;; �ե��������
;(if (eq window-system 'mac) (require 'carbon-font))
;(fixed-width-set-fontset "hirakaku_w3" 10)
;(setq fixed-width-rescale nil)

;ElScreen
(setq elscreen-prefix-key "\C-z")
(require 'elscreen)
;(if window-system
;    (define-key elscreen-map "\C-z" 'iconify-or-deiconify-frame)
;  (define-key elscreen-map "\C-z" 'suspend-emacs))

;create screen automatically
(defmacro elscreen-create-automatically (ad-do-it)
  `(if (not (elscreen-one-screen-p))
       ,ad-do-it
     (elscreen-create)
     (elscreen-notify-screen-modification 'force-immediately)
     (elscreen-message "New screen is automatically created")))

(defadvice elscreen-next (around elscreen-create-automatically activate)
  (elscreen-create-automatically ad-do-it))

(defadvice elscreen-previous (around elscreen-create-automatically activate)
  (elscreen-create-automatically ad-do-it))

(defadvice elscreen-toggle (around elscreen-create-automatically activate)
  (elscreen-create-automatically ad-do-it))

;visible-bell
(setq visible-bell t)

;shell-mode
(setq shell-file-name "bash")
(setenv "SHELL" shell-file-name)
(setq explicit-shell-file-name shell-file-name)
(setq explicit-sh-args '("-login" "-i"))
(setq shell-command-switch "-c")
(setq win32-quote-process-args t)


(setq truncate-partial-width-windows nil)
(set-language-environment 'Japanese)
(set-default-coding-systems 'euc-jp-unix)
(set-keyboard-coding-system 'euc-jp)
(set-buffer-file-coding-system 'euc-jp)
(if (not window-system) (set-terminal-coding-system 'euc-jp))
(setq process-coding-system-alist
     (cons
     '(".*" euc-jp . euc-jp)
      process-coding-system-alist))

(global-font-lock-mode t)
(setq-default transient-mark-mode t); ����ޡ����⡼�ɤμ�ưͭ����
(setq highlight-nonselected-windows t)
; C-x C-u �����⤷�ʤ��褦���ѹ�����
(global-unset-key "\C-x\C-u")
(show-paren-mode 1) ;��̤��б���ϥ��饤��.
(setq next-line-add-newlines nil) ;�Хåե�������;�פʲ��ԥ����ɤ��ɤ����������
(define-key ctl-x-map "l" 'goto-line) ; C-l �� goto-line ��¹�
; C-h �ǥ�������κ��ˤ���ʸ����ä�
(define-key global-map "\C-h" 'delete-backward-char)
; C-o ��ưŪά��Ÿ����ǽ�������Ƥ�
(define-key global-map "\C-o" 'dabbrev-expand)
(setq dabbrev-case-fold-search nil) ; ��ʸ����ʸ�������
;; ���ܸ졦�Ѹ캮����ʸ�Ǥζ���Ƚ��
(defadvice dabbrev-expand
  (around modify-regexp-for-japanese activate compile)
  "Modify `dabbrev-abbrev-char-regexp' dynamically for Japanese words."
  (if (bobp)
      ad-do-it
    (let ((dabbrev-abbrev-char-regexp
           (let ((c (char-category-set (char-before))))
             (cond 
              ((aref c ?a) "[-_A-Za-z0-9]") ; ASCII
              ((aref c ?j) ; Japanese
               (cond
                ((aref c ?K) "\\cK") ; katakana
                ((aref c ?A) "\\cA") ; 2byte alphanumeric
                ((aref c ?H) "\\cH") ; hiragana
                ((aref c ?C) "\\cC") ; kanji
                (t "\\cj")))
              ((aref c ?k) "\\ck") ; hankaku-kana
              ((aref c ?r) "\\cr") ; Japanese roman ?
              (t dabbrev-abbrev-char-regexp)))))
      ad-do-it)))
;; delete region with back space key
(delete-selection-mode 1)
;; cperl-mode
;(autoload 'perl-mode "cperl-mode" "alternate mode for editing Perl programs" t)
;(setq cperl-auto-newline t)
(setq cperl-indent-parens-as-block t)
(setq cperl-close-paren-offset -4)
(setq cperl-indent-level 4)
(setq cperl-label-offset -4)
(setq cperl-continued-statement-offset 4)
(setq cperl-highlight-variables-indiscriminately t)
(add-hook 'cperl-mode-hook
          (lambda ()
	    (define-key cperl-mode-map "\C-cc" 'cperl-check-syntax)
	    (define-key cperl-mode-map "\C-cm" 'cperl-pod-to-manpage)
	    (define-key cperl-mode-map "\C-cd" 'my-perldb)
	    (setq indent-tabs-mode nil)
            (set-face-italic-p 'cperl-hash-face nil)))
(setq auto-mode-alist
      (append '(("\\.t$" . cperl-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.pm$" . cperl-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.pl$" . cperl-mode)) auto-mode-alist))
;(setq cperl-invalid-face nil)

;soft tab
(setq-default tab-width 4 indent-tabs-mode nil)

(add-to-list 'default-frame-alist '(alpha . (0.85 0.85)))


;;====================================
;;; �ޤ��֤�ɽ��ON/OFF
;;====================================
(defun toggle-truncate-lines ()
  "�ޤ��֤�ɽ����ȥ���ư��ޤ�."
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))


(global-set-key "\C-c\C-l" 'toggle-truncate-lines) ; �ޤ��֤�ɽ��ON/OFF
