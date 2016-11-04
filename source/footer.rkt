(module footer racket

  (provide render-footer)
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;渲染页脚：
  (define (render-footer)
    `(footer
      ,(render-links)
      ,(render-copyright)))

  ;链接结构：
  (struct footer-link (text link))

  ;连接表：
  (define footer-links
    (list (footer-link "联系我们" "index.html")
          (footer-link "意动力公众平台" "index.html")))

  ;渲染链接：
  (define (render-link link)
    `(span "|"
           (a ((href ,(footer-link-link link)))
              ,(footer-link-text link))))
  (define (render-links)
    `(p
       ,@(map render-link footer-links)
       (span "|")))

  ;copyright信息：
  (define copy-right "Copyright © 2016 意动力（eForce）众创空间. All Rights Reserved.")

  ;渲染copyright信息：
  (define (render-copyright)
    `(p ,copy-right))
  )