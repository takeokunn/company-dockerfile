# company-dockerfile

Add dockerfile keywords to company-mode keywords alist.

## Config

```emacs-lisp
(add-hook 'dockerfile-mode-hook
          (lambda ()
            (setq company-minimum-prefix-length 2)
            (add-to-list 'company-backends #'company-dockerfile))
```
