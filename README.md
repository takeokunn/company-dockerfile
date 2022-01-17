# company-dockerfile

Add dockerfile keywords to company-mode keywords alist.

## Config

```emacs-lisp
(add-hook 'dockerfile-mode-hook
          (lambda ()
            (add-to-list 'company-backends #'company-dockerfile))
```
