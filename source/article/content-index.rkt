(module content-index racket
  
  (provide render-section-hotpot
           render-section-emphasis)
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;渲染页面内容：

  ;;渲染热点内容：
  (define (render-section-hotpot)
    `(section ((id "hotpot"))
          (h2 "最新热点")
          (div
           ,(render-new-hotpot)
           ,(render-hotpot-list))))

  (define (render-new-hotpot)
   `(article ((class "new-hotpot"))
             (img ((src "/../article/前台.jpg")
                   (alt "意动力（eForce）众创空间入驻登记中")))
             (p "意动力（eForce）众创空间入驻登记中……")))

  ;文章列表：
  (define article-list
    (list "意动力（eForce）起航！"
          "意动力（eForce）介绍——硬件篇"
          "意动力（eForce）众创空间入驻登记中……"))
  
  (define (render-hotpot-list)
    `(article ((class "hotpot-list"))
      (ul
       ,@(map render-a-article article-list))))
  
  (define (render-a-article a-article)
    `(li
      (a
       ,a-article)))

  ;渲染重点内容：
  (define (render-section-emphasis)
    `(section ((id "emphasis"))
      ,(render-article-emphasis
        "微企优惠政策"
        "微企优惠政策微企优惠政策微企优惠政策微企优惠政策微企优惠政策微企优惠政策")
      ,(render-article-emphasis
        "合伙人的权利与义务"
        "合伙人的权利与义务合伙人的权利与义务合伙人的权利与义务合伙人的权利与义务合伙人的权利与义务")
      ,(render-article-emphasis
        "创业公司会遇到哪些法律问题"
        "创业公司会遇到哪些法律问题创业公司会遇到哪些法律问题创业公司会遇到哪些法律问题创业公司会遇到哪些法律问题创业公司会遇到哪些法律问题")))

  (define (render-article-emphasis title text)
    `(article
      (h3 ((class "title")) ,title)
      (p ((class "summary")) ,text)
      (p ((class "more"))"更多……")))
  )
