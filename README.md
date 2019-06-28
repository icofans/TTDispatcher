# AppDelegate模块化解藕组件

## 思路
1.通过运行时对UIApplication类进行hook，在交换的setDelegate方法中去交换appdelegate的23个方法，并指定一个类去处理交换后的方法。

2.在处理delegate方法的类，对已注册事件的module进行事件派发

3.在Appdelegate维护需要注册的module，之后需要使用的module就可以直接使用Appdelegate的事件了。

## 使用

```ruby
pod 'TTDispatcher'
```
