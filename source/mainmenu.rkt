(module navigate racket
  
  (provide render-mainmenu)  
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;渲染导航栏：

  ;单菜单项结构：
  (struct nav-item (title link))
  
  ;块状菜单项：
  (define nav-items-operation
    (list
     (list (nav-item "工商注册" "")
           (nav-item "资质办理" "")
           (nav-item "财税服务" "")
           (nav-item "社保服务" ""))
     (list (nav-item "文化建设" "")
           (nav-item "企业培训" "")
           (nav-item "拓展训练" "")
           (nav-item "人力资源" ""))
     (list (nav-item "法律服务" "")
           (nav-item "知识产权" "")
           (nav-item "企业采购" ""))))
  
  (define nav-items-promotion
    (list
     (list (nav-item "项目路演" "")
           (nav-item "品牌策划" "")
           (nav-item "品牌推广" ""))))
  
  (define nav-items-practice
    (list
     (list (nav-item "视觉设计" "")
           (nav-item "网站开发" "")
           (nav-item "微信平台" ""))
     (list (nav-item "软件开发" "")
           (nav-item "APP开发" ""))))
  
  (define nav-items-space
    (list
     (list (nav-item "关于我们" ""))
     (list (nav-item "地理位置" "")
           (nav-item "周边环境" "")
           (nav-item "办公环境" ""))
     (list (nav-item "配套设施" ""))))

  ;全菜单项结构：
  (struct nav-top-item (title item name))
  
  ;全菜单项：
  (define nav-top-home (nav-item "首页" "index.html"))
  (define nav-top-items
    (list (nav-top-item "运作支持" nav-items-operation "nav-items-operation")
          (nav-top-item "推广支持" nav-items-promotion "nav-items-promotion")
          (nav-top-item "落地支持" nav-items-practice "nav-items-practice")
          (nav-top-item "空间介绍" nav-items-space "nav-items-space")))
  
  ;渲染单菜单项：
  (define (render-nav-item item)
    `(a ((class "nav-item")
         (target "")
         (href ,(nav-item-link item)))
        ,(nav-item-title item)))

  ;渲染菜单列：
  (define (render-nav-items-col items)
    `(div ((class "col"))
          ,@(map render-nav-item items)))
   
  ;渲染块状菜单：
  (define (render-nav-items items name)
    `(div ((class ,(string-append name " nav-block")))
          ,@(map render-nav-items-col items)))

  ;渲染单个顶层菜单：
  (define (render-nav-top a-nav-top-item)
    `(li ((class "drop"))
         (h2 ((class "nav-top"))
          ,(nav-top-item-title a-nav-top-item))
         ,(render-nav-items
           (nav-top-item-item a-nav-top-item)
           (nav-top-item-name a-nav-top-item))))

  ;渲染Home菜单：
  (define (render-nav-top-home)
    `(li ((class "nav-top single"))
      (h2 ((class "nav-top"))
       (a ((target "")
           (href ,(nav-item-link nav-top-home)))
          ,(nav-item-title nav-top-home)))))
  
  ;渲染导航菜单：
  (define (render-mainmenu)
  `(nav ((id "mainmenu"))
        (ul
         ,(render-nav-top-home)
         ,@(map render-nav-top nav-top-items))))
   )
