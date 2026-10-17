---
title: 视觉感知方向的常见数据集
date: 2026-10-17T09:32:20+08:00
draft: false
tags:
  - 数据集
categories:
  - 数据集
description: 记录一些视觉感知方向的常见数据集的关键特性和关键点。
---

## COCO
  - 2D数据集
  - annotations
    - segmentation
    - bounding box
    - person keypoints
    - caption---对图片的文字描述
  - 关键点
    - COCOAPI---开源
    - 从类别ID开始
    - 可以通过类别ID获取包含ID的所有图片ID
    - 通过 图片ID + 类别ID 获取标注信息
