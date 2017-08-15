;;; lsp-swift.el --- Swift support for lsp-mode

;; Copyright (C) 2017 Sébastien Duperron <liquidsoul@liquidsoul.fr>

;; Author: Sébastien Duperron <liquidsoul@liquidsoul.fr>
;; Version: 1.0
;; Package-Requires: ((lsp-mode "2.0") (swift-mode "2.3.0"))
;; Keywords: swift
;; URL: https://github.com/liquidsoul/lsp-swift

(require 'swift-mode)
(require 'lsp-mode)

(lsp-define-stdio-client 'swift-mode "swift" 'stdio
                         (lsp-make-traverser #'(lambda (dir)
                                                 (directory-files
                                                  dir
                                                  nil
                                                  "Package\\.swift")))
                         "Swift Language Server"
                         ;; FIXME Relative path to locally build lsp server
                         (expand-file-name "../../swift-langsrv/.build/release/langsrv" (file-name-directory load-file-name))
                         )

(provide 'lsp-swift)
