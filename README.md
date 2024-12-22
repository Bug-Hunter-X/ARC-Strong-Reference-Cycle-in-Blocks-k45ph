# Objective-C ARC Strong Reference Cycle in Blocks

This repository demonstrates a common issue in Objective-C: strong reference cycles within blocks when using Automatic Reference Counting (ARC).  Even with a weak self reference, a strong back reference can lead to memory leaks.

The `bug.m` file shows the problematic code. The `bugSolution.m` file offers a corrected version using appropriate techniques to avoid the cycle.

## How to reproduce the bug:
1. Clone the repository
2. Build and run the project (using Xcode)
3. Observe the memory usage or use Instruments to detect the memory leak.