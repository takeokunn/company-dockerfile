;;; company-dockerfile.el --- Company mode backend for dockefile  -*- lexical-binding: t -*-

;; Author: takeokunn
;; Maintainer: takeokunn
;; Version: 0.1
;; Package-Requires: ("company-mode" "dockerfile-mode")
;; Homepage: https://github.com/takeokunn/company-dockerfile
;; Keywords: company-dockerfile company-mode dockerfile-mode


;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; To use this package with company-mode run;
;; (add-hook 'dockerfile-mode-hook
;;           (lambda ()
;;             (add-to-list 'company-backends #'company-dockerfile))

;; To use this package, you must be in dockerfile major mode.

;;; Code:

(require 'cl-lib)
(require 'company)
(require 'dockerfile-mode)

(defconst dockerfile-keywords
  '("FROM"
    "AS"
    "RUN"
    "CMD"
    "LABEL"
    "MAINTAINER"
    "EXPOSE"
    "ENV"
    "ADD"
    "COPY"
    "ENTRYPOINT"
    "VOLUME"
    "USER"
    "WORKDIR"
    "ARG"
    "ONBUILD"
    "STOPSIGNAL"
    "HEALTHCHECK"
    "SHELL")
  "Keywords of the dockerfile.")

(defconst dockerfile-option-keywords
  '("--platform="
    "--chown="
    "--interval="
    "--timeout="
    "--start-period="
    "--retries=")
  "Keywords of the dockerfile options")

(defvar company-dockerfile-keywords
  (concatenate 'list dockerfile-keywords dockerfile-option-keywords))

(defun company-dockerfile--candidates (prefix)
  (let (res)
    (dolist (item company-dockerfile-keywords)
      (when (string-prefix-p prefix item)
        (push item res)))
    res))

(defun company-dockerfile (command &optional arg &rest ignored)
  "Dockerfile backend for company mode."
  (interactive (list 'interactive))
  (cl-case command
    (interactive (company-begin-backend 'company-dockerfile))
    (prefix (when (eq major-mode 'dockerfile-mode)
              (company-grab-symbol)))
    (candidates (company-dockerfile--candidates arg))))

(provide 'company-dockerfile)

;;; company-dockerfile.el ends here
