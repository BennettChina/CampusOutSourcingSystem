# CampusOutSourcingSystem

这是系统其实是我的毕业设计，还不够完美，后续有时间还会优化她。

她仅仅使用了Struts2框架，因此代码还不够优美，她的功能包含了以下内容：

## 首页

这部分包含了其他各个模块的入口，以及展示了被推荐展示的校园内商家

## 登录、注册

这部分做的并不是很好，还没有用到加密算法。而且没有登录的用户也可以下单，这个bug是当初的我考虑不周导致，后续可以将这部分完善

## 餐厅

这部分主要是将选择的餐厅的商家（包含该餐厅周边商家）展示出来，提供一个商家的入口。可以搜索商家、切换餐厅、根据商家的类型筛选用户需要的商家等

## 商家

给出商家的详细信息，以及一个简单的购物车功能。下单后会跳转到`确认购买`界面，在这个界面才需要填写用户接收商品的信息。

## 任务大厅

通过将下单后的商品放到任务大厅，供给所有已注册的学生去接取任务后配送商品到顾客手中。此举来源于学生之间的互相带饭，可以通过这种方式完成配送的环节，还可以每单获取到少量的配送费

## 商家入驻

和普通用户的注册、登录类似的情况，没有加密、没有用到真正的手机号注册。也是需要优化的一个模块

### 商家添加商品

### 商家管理商品



## 管理员

作为该系统的管理，我没有将入口放在网站的任何地方，仅能通过网址进入，也包含登录、注册，管理员设计之初主要是让管理员审核注册的商家以及管理推荐商品