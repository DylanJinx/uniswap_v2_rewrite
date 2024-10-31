### 1. `min(uint x, uint y) internal pure returns (uint z)`
这个函数用于比较两个无符号整数（`uint`），返回两者中的较小值。

### 2. `sqrt(uint y) internal pure returns (uint z)`
这个函数用于计算一个无符号整数的平方根。它使用了巴比伦方法（Babylonian method），这是一种古老且效率较高的算法，用于近似计算平方根。函数逻辑如下：
- 如果`y`大于3，函数将使用迭代方法逼近`y`的平方根。初始估计为`y`自身，然后逐步优化这个估计值直到连续两次迭代的结果不再变化（即`x < z`不成立时停止）。
- 如果`y`等于1或2，直接返回1作为平方根，因为1和2的平方根不能整除，但在很多场合近似为1是可接受的。
- 如果`y`等于0，平方根也是0（此情况在代码中没有明确处理，但由于Solidity函数变量默认初始化为0，所以这里逻辑也是安全的）。

巴比伦方法（也称为牛顿-拉弗森方法）来计算平方根，核心的迭代公式是：

$z_{\text{new}} = \frac{1}{2} \left( z + \frac{y}{z} \right)$

这个公式的目的是通过迭代逼近真实的平方根值。在每次迭代中，当前的猜测值 $z$ 和 $y$ 除以当前猜测值 $z$ 的结果的平均值会成为下一个更精确的猜测值。

### 公式解释
- **$y$** 是你想要计算平方根的数字。
- **$z$** 是对 $y$ 的平方根的猜测值。
- **$\frac{y}{z}$** 计算当前猜测值的平方与实际值 $y$ 之间的比率。
- **$z + \frac{y}{z}$** 将当前猜测值与这个比率的和求出。
- **$\frac{1}{2} \left( z + \frac{y}{z} \right)$** 求上述和的平均值，作为下一次迭代的新猜测值。

### 实例讲解
假设我们想要计算 $y = 9$ 的平方根，从 $z = 9$ 开始：

1. **初始猜测**：z = 9
2. **第一次迭代**：
   $$z_{\text{new}} = \frac{1}{2} \left( 9 + \frac{9}{9} \right) = \frac{1}{2} (9 + 1) = 5.0$$
   更新 $z$ 为 5.0。

3. **第二次迭代**：
   $$z_{\text{new}} = \frac{1}{2} \left( 5.0 + \frac{9}{5.0} \right) = \frac{1}{2} (5.0 + 1.8) = 3.4$$
   更新 $z$ 为 3.4。

4. **后续迭代**：
- 第三次迭代：z = 3.023529411764706
- 第四次迭代：z = 3.00009155413138
- 第五次迭代：z = 3.000000001396984