(module banner racket

  (provide render-banner)

  (require "head.rkt")
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;渲染广告栏：

  ;广告图片结构：
  (struct banner-pic (link pic))
  
  ;广告图片列表：
  (define pics
    (list
     (banner-pic "#" (string-append path-image "ad-1.png"))
     #|(banner-pic "#" (string-append path-image "ad-2.png"))|#))

  (define (render-pic pic)
    `(a ((href ,(banner-pic-link pic)))
      (img ((src ,(banner-pic-pic pic))))))
  
  (define (render-pics)
    `(div ((class "layout"))
          ,@(map render-pic pics)))

  (define (render-banner)
    `(section ((id "banner"))
          (a ((class "pre")))
          ,(render-pics)
          (a ((class "next")))))
  )
