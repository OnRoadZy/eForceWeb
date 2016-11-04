(module head racket
  
  (provide set-head
           path-static-file
           path-css
           path-image
           path-script)

  ;;定义路径：
  (define path-static-file "htdocs")
  (define path-css "/css/")
  (define path-image "/image/")
  (define path-script "/script/")
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;head设置函数：

  (define title-str "意动力（eForce）众创空间")
  
  (define description-str "意动力众创空间是响应国家“大众创业，万众创新”的号召而成立的联合办公空间，设置有独立办公区，开放办公区，创客咖啡区，创客独立办公区，项目路演室，创客厨房，创客餐厅等。联合社会各界力量，整合各类资源，凭借意动力(eForce)项目路演,意动力(eForce)众创大赛,意动力(eForce)创新创业大赛,意动力(eForce)创业营,意动力(eForce)创业基地等创业助推器，打造全要素孵化加速众创平台，助力创业者实现创业梦想，让“大众创业、万众创新”成为一种新常态。")
  
  (define keywords-str "意动力,eForce,意动力众创空间,企业服务,创业服务,办公空间,soho空间,项目路演,众创大赛,创新创业大赛,创业营,创业基地")

  ;设置head参数：
  (define (set-head)
    `(head
      (title ,title-str)
      ,(set-icon)
      ,(set-keywords)
      ,(set-description)
      ,(set-charset)
      ,(set-content-type)
      ,@(set-css)
      ,@(set-js)))

  (define (set-icon)
    `(link ((rel "shortcut icon")
            (href ,(string-append path-image "favicon.ico"))
            (type "image/x-icon"))))
    
  (define (set-content-type)
    `(meta ((http-equiv "content-type")
            (content "text/html; charset=UTF-8"))))
  
  (define (set-charset)
    `(meta ((charset "utf-8"))))
  
  (define (set-keywords)
    `(meta ((name "keywords")
            (content ,keywords-str))))
  
  (define (set-description)
    `(meta ((name "description")
            (content ,description-str))))

  ;设置css：
  (define css
    (list "common.css"
          "index.css"
          "header.css"
          "mainmenu.css"
          "banner.css"
          "content.css"
          "footer.css"))
  
  (define (set-css)
    (map set-css-path css))
  
  (define (set-css-path path)
    `(link ((type "text/css")
            (rel "stylesheet")
            (href ,(string-append path-css path)))))

  ;设置js：
  (define js
    (list "jquery.js"
          "index.js"))
  
  (define (set-js)
    (map set-js-path js))
  
  (define (set-js-path path)
    `(script ((type "text/javascript")
              (async "")
              (src ,(string-append path-script path)))))
  )
