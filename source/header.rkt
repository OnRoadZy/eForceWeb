(module header racket

  (provide render-header)

  (require "head.rkt")
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;渲染header:
  (define (render-header)
    `(header
      ,(render-logo)
      ,(render-user)))
  
  (define (render-logo)
    `(div ((id "logo"))
          (a ((class "logo")
              (href "http://www.eforce.cq.cn"))
             (img ((src ,(string-append path-image "logo.png"))
                   (alt "意动力（eForce）众创空间"))))
          (h1 ((class "name"))
              "意动力（eForce）众创空间")))
  
  (define (render-user)
    `(div ((id "user"))
          ,(render-feedback)
          ,(render-user-info)))
  
  ;;反馈
  (define (render-feedback)
    `(a ((class "feedback")
         (href "")
         (target "_blank"))
        (h3
         "反馈")))
  
  ;;用户登录
  (define (render-user-info)
    `(div ((class "user-info"))
          (div ((class "unlogin")
                (style "display:none"))
               (h3 "登录"))
          (div ((class "logined")
                (style ""))
               (h3 "欢迎您！"
                   (span ((class "hover-arrow")))))))
  )
