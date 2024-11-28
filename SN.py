"""
[课   题]: Python爬取苏宁易购商品数据

[授课老师]: 青灯教育-巳月    [上课时间]: 20:05

[环境介绍]:
    python 3.8
    pycharm 专业版
    selenium
    谷歌浏览器
    浏览器驱动

先听一下歌, 等一下后面进来的同学, 20:05开始讲课 有什么喜欢听的歌 也可以发在公屏上

[没听懂?]
课后的回放录播资料找邀课老师微信
+python安装包 安装教程视频
+pycharm 社区版  专业版 及 激活码免费

就业  1
    爬虫开发
    数据分析
    网站开发
兼职  2   5个月
    技术:
        核心编程    2   2260
        爬虫开发    2   2980
        数据分析    1   2180
        60-70% 就能够做一些比较简单的外包了 1000以内
    外包单从哪里来?
        我们青灯教育 专门给vip学员发展的一个外包渠道
        教大家如何发展外包渠道
兴趣  3

爬虫开发
数据分析
网站开发

每周 135 / 246 晚上 8-10 直播授课
课后 作业 + 阶段 考核 + 老师一对一解答辅导 + 免费重修机制

兼职班 6680 / 18 = 371.11
    5个月期间 最高可以领取到 1336 学费返现
    1336 / 5 = 267.2
"""
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
import csv

with open('苏宁.csv', mode='w', encoding='utf-8', newline='') as f:
    csv_writer = csv.writer(f)
    csv_writer.writerow(['title', 'price', 'comment_count', 'store_stock', 'img_url', 'href'])

# 1. 打开谷歌浏览器
driver = webdriver.Chrome()
# 2. 打开一个网页
driver.get('https://search.suning.com/iPhone/')
for page in range(33):
    time.sleep(1)
    # 3. 下拉页面
    driver.execute_script('document.querySelector("body > div.ng-footer > div.ng-s-footer").scrollIntoView()')
    time.sleep(1)
    driver.execute_script('document.querySelector("body > div.ng-footer > div.ng-s-footer").scrollIntoView()')
    time.sleep(1)
    # 4. 提取数据
    divs = driver.find_elements(By.CSS_SELECTOR, '.product-box')
    for div in divs:
        title = div.find_element(By.CSS_SELECTOR, '.title-selling-point').text
        price = div.find_element(By.CSS_SELECTOR, '.price-box').text
        comment_count = div.find_element(By.CSS_SELECTOR, '.evaluate-old.clearfix').text
        store_stock = div.find_element(By.CSS_SELECTOR, '.store-stock').text
        img_url = div.find_element(By.CSS_SELECTOR, '.img-block img').get_attribute('src')
        href = div.find_element(By.CSS_SELECTOR, '.title-selling-point a').get_attribute("href")
        print(title, price, comment_count, store_stock, img_url, href)
        # 5. 保存数据
        with open('苏宁.csv', mode='a', encoding='utf-8', newline='') as f:
            csv_writer = csv.writer(f)
            csv_writer.writerow([title, price, comment_count, store_stock, img_url, href])
    driver.execute_script('document.querySelector("#nextPage").click()')