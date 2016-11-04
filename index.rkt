#lang web-server/insta

(require "source/head.rkt"
         "source/header.rkt"
         "source/mainmenu.rkt"
         "source/banner.rkt"
         "source/content-index.rkt"
         "source/footer.rkt")

;;设置网站静态目录：
(static-files-path path-static-file)

;;响应主页申请：
(define (start request)
  (render-index request))

;;渲染页面：
(define (render-index request)
   (response/xexpr
    `(html
      ,(set-head)
      ,(render-body))))

;;定义页面渲染函数：
(define (render-body)
  `(body
    ,(render-header)
    ,(render-mainmenu)
    ,(render-banner)
    ,(render-section-hotpot)
    ,(render-section-emphasis)
    ,(render-footer)))
