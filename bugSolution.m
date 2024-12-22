To fix the strong reference cycle, several approaches can be used.  One is to avoid strong references entirely if possible within the block, using a weak or assign property, depending on circumstances.  Another is to manage the references more carefully.  Consider this corrected version:

```objectivec
@property (strong, nonatomic) SomeClass *someObject;

- (void)someMethod {
    __weak typeof(self) weakSelf = self;
    [self.someObject doSomethingWithCompletion:^(SomeClass *object) {
        __strong typeof(self) strongSelf = weakSelf; // Strong self only inside block scope
        if (strongSelf) { // Check for deallocation
            [strongSelf.someObject doSomethingElse]; 
        }
    }];
}
```

Here, we create a strong self reference only within the scope of the block using `__strong typeof(self) strongSelf = weakSelf;`, thereby preventing the cycle.  The check `if (strongSelf)` ensures that the method call is safe, protecting from calling methods on an already deallocated object. If `object` still holds a reference to `self`,  make sure to break the reference cycle in the `SomeClass` using a `weak` property for `self`.