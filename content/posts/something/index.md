---
title: 随笔一些语言或则系统特性
date: 2026-07-22T09:32:20+08:00
draft: false
tags:
  - 随笔
categories:
  - 随笔
description: 随笔一些语言或则系统特性。
---

## python
### 1. python 函数传递引用，但是重新绑定形参不会影响外部变量---相当于创建新对象
### 2. python 中 a+=1 相当于 a = a + 1，这是创建了新对象绑定到 a+1;; 但是pytorchz 中 a+=1 是 in-place操作，不会创建新对象，节省内存，但是会破坏计算图的建立

## C++

### 1. static 关键字被重载了三种不同的含义

## tensorrt

### 1. tensorrt GA 库，NVIDIA核心推理引擎，闭源，需要再官网下载预编译好的库；； tensorrt oss库，tensorRT周边开源项目，依赖tensorrt GA。

## 微架构

### 1. 从微架构可以看出，GPU有更多的小核心，每个核心都比CPU核心小很多；单个线程在单个核心上执行CPU要快很多。 但是GPU的小核心数量特别多，这样就可以同时让成千上万个线程并行执行。整体胜利。
### 2. GPU每个SM都有一个可以分配的L1 + share memory 的片上资源；；其中L1 cache中还被分出来一个constant cache，专门用来存放常量数据。__const__ 修饰的变量会被放到constant cache中。方便同一SM中的所有线程快速访问。

## cuda

### 1. 别重复造轮子，多用已有的库，比如 cuDNN, cuBLAS, cuSolver, cuFFT, cuRAND, 以及 cuSPARSE。这些都是 NVIDIA 官方提供的，性能和稳定性都非常好。
### 2. SM  stream multiprocessor， 一个block中的所有的线程都在同一个SM上执行，L1cache + shared memory + register 即是SM的资源，这些block中线程即是共享这些资源的。
### 3. UVA unified virtual addressing； CPU和GPU统一使用一套虚拟地址空间。
```cpp
float* gpu_ptr;
cudaMalloc(&gpu_ptr, size);
cudaMemcpy(gpu_ptr, cpu_ptr, size, cudaMemcpyHostToDevice);  // 在UVA之前，这个拷贝必须依赖cudaruntime,实现记录GPU的地址；； 有了UVA之后，可以直接进行拷贝，这里都是虚拟地址，底层会自动映射。
```
