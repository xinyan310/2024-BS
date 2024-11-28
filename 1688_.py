import time
from selenium import webdriver
from selenium.webdriver.common.by import By
import csv

# 获取用户输入的搜索关键词
keyword = input("请输入搜索关键词: ")

# 拼接网址
url = 'https://p4psearch.1688.com/page.html?hpageId=old-sem-pc-list&keywords=粽子&cosite=baidujj_pz&location=re&trackid=885662561117990122602&spm=a2638t.b_30496503.szyx_head.submit&keywordid=&bt=&exp=pcCpxGuessExp%3AA&ptid=hr1066c8189143a1'

# 创建CSV文件并写入标题行
with open('1688.csv', mode='w', encoding='utf-8', newline='') as f:
    csv_writer = csv.writer(f)
    csv_writer.writerow(['title', 'price', 'comment_count', 'store_stock', 'img_url', 'href'])

# 1. 打开谷歌浏览器
driver = webdriver.Chrome()

# 2. 打开拼接好的网址
driver.get(url)

# 3. 爬取数据，假设爬取33页
for page in range(33):
    time.sleep(1)
    # 4. 下拉页面，确保加载所有产品
    # driver.execute_script('document.querySelector("body > div.ng-footer > div.ng-s-footer").scrollIntoView()')
    # time.sleep(1)
    # driver.execute_script('document.querySelector("body > div.ng-footer > div.ng-s-footer").scrollIntoView()')
    # time.sleep(1)

    # 5. 提取数据
    divs = driver.find_elements(By.CSS_SELECTOR, '.offer_exp')

    for div in divs:
        print(div)

        title = div.find_element(By.CSS_SELECTOR, '.offer-title span').text
        price = div.find_element(By.CSS_SELECTOR, '.offer-price span').text
        #comment_count = div.find_element(By.CSS_SELECTOR, '.evaluate-old.clearfix').text
        #store_stock = div.find_element(By.CSS_SELECTOR, '.store-stock').text
        img_url = div.find_element(By.CSS_SELECTOR, '.offer-img img').get_attribute('src')
        #href = div.find_element(By.CSS_SELECTOR, '.title-selling-point a').get_attribute("href")
        print(title, price,img_url)

        # 6. 保存数据到CSV
        # with open('苏宁.csv', mode='a', encoding='utf-8', newline='') as f:
        #     csv_writer = csv.writer(f)
        #     csv_writer.writerow([title, price, comment_count, store_stock, img_url, href])

    # 7. 点击下一页
    # next_button = driver.find_element(By.CSS_SELECTOR, '#nextPage')
    # if next_button.is_enabled():  # 检查下一页按钮是否可用
    #     next_button.click()
    # else:
    #     break  # 如果没有下一页，退出循环
    # time.sleep(2)  # 等待页面加载
    break
# 8. 关闭浏览器
driver.quit()