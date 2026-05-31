#!/bin/bash
cd ~/lijiaxin_blog/content/posts
read -p "文章文件夹名（英文，如 yolov5-qat）: " name
mkdir -p "$name"
cat > "$name/index.md" << 'INNER'
---
title: ""
date: $(date +%Y-%m-%dT%H:%M:%S+08:00)
draft: true
tags: []
categories: []
description: ""
---

## 背景

## 核心内容

## 关键图示

## 实验结果

## 踩坑记录
INNER
echo "创建完成: posts/$name/index.md"
