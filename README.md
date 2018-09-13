# MYKVO
##KVC：

 **介绍**： Key Value Coding 键值编码

**作用**


      /*
         生成模型对象
         LMPerson * person = [[LMPerson alloc]init];
         person.name = @"张三";
         person.age = 18;
         */
        
        /*
         1. 为属性赋值
        [person setValue:@"李四" forKey:@"name"];
        */
        
        /*
         2.1 修改类的私有属性
         [person setValue:@"feamel" forKey:@"sex"];
         [person printAge];
         
         */
        /**
         2.2 获取类的私有属性
         NSString * sexstr = [person valueForKey:@"sex"];
         NSLog(@"%@",sexstr);
         */
        /*
         3. 字典转模型
         注意：1->字典中的健值必须和模型中名称一样，并且只可以少于或等于模型中的健值，如果多处会报setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key weight.'这样的错误提示；
         
         NSDictionary * dic = @{
         @"name":@"lili",
         @"age":@"11",
         @"sex":@"man",
         };
         
         [person setValuesForKeysWithDictionary:dic];
         NSLog(@"person  name = ------%@   age = ---%ld",person.name,(long)person.age);
         [person printAge];
         
         */
         二. KVO  

##KVO
1.KVO介绍：

     KVO 是键值观察者（key-value-observing）。KVO提供了一种观察者的机制，通过对某个对象的某个属性添加观察者，当该属性改变，就会调用"observeValueForKeyPath:"方法，为我们提供一个“对象值改变了！”的时机进行一些操作。

2.KVO原理

　　当某个类的对象第一次被观察时，系统在运行时会创建该类的派生类，该派生类中重写了该对象的setter方法，并且在setter方法中实现了通知的机制。派生类重写了class方法，以“欺骗”外部调用者他就是原先那个类。系统将这个类的isa指针指向新的派生类，因此该对象也就是新的派生类的对象了。因而该对象调用setter就会调用重写的setter，从而激活键值通知机制。此外派生类还重写了delloc方法来释放资源。

3.KVO的使用

  * 给对象的属性添加观察者　　

    [appleVC addObserver:self forKeyPath:@"name" options: NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
   注： options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld 返回未改变之前的值和改变之后的值    context可以为空


 * 若该属性发生改变，实现观察响应方法：

```
     -(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    //拿到新值/旧值,进行操作
    NSLog(@"newValue----%@",change[@"new"]);
    NSLog(@"oldValue----%@",change[@"old"]);

}

```

 * 移除观察者

```
-(void)dealloc
{
    [person removeObserver:self forKeyPath:@"test"];
}

```

4.KVO的使用场景

KVO用于监听对象属性的改变。

* 下拉刷新、下拉加载监听UIScrollView的contentoffsize；
* webview混排监听contentsize；
* 监听模型属性实时更新UI；
* 监听控制器frame改变，实现抽屉效果。

**KVO好的文章集锦**

* 简书啊左：iOS开发 -- KVO的实现原理与具体应用https://www.jianshu.com/p/e59bb8f59302





    

