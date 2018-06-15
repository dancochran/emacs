(setq inhibit-splash-screen t)

(transient-mark-mode 1)

(require 'org)


(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  ;;(add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(package-selected-packages (quote (markdown-mode anaconda-mode chess)))
 '(show-paren-mode t)
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; always open python files in anaconda mode
(add-hook 'python-mode-hook 'anaconda-mode)

;; Force extra windows to open on the side (horizontal split) instead of on the bottom
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; Force column numbers always on
(setq column-number-mode t)

(defun meetingheader (subject timelabel)
  "Insert formatted meeting header with current date at point"
  (interactive "sSubject: \nsTime label: \n")
  (setq strdate (format-time-string "%A, %B %d, %Y "))
  ;; magic numbers: 18 is the leading/trailing stuff and the dashes and inline spaces; 103 is the total length of the = header
  (setq contentlen (+ (length subject) (length timelabel) (length strdate) 18))
  (insert "=======================================================================================================\n")
  (insert "====== " subject " - " strdate "- " timelabel)
  (insert (concat (make-string (- 103 contentlen) (string-to-char " "))))
  (insert "======\n")
  (insert "=======================================================================================================\n")
  (message "Added meeting header"))
  
