# coding=utf-8
from flask import Flask, jsonify, request
from flask_cors import CORS
import time
import os
import re
import requests
from selenium import webdriver
from selenium.webdriver.common.by import By
from DrissionPage import ChromiumPage
import urllib.parse
from email.mime.text import MIMEText
from email.header import Header
import smtplib
import uuid
import matplotlib.pyplot as plt
import base64
from PIL import Image
import pillow_avif
from io import BytesIO
import matplotlib
matplotlib.use('Agg')  # 使用非图形界面的Agg后端
import matplotlib.pyplot as plt
from matplotlib import rcParams
image_counter = 0
# 设置中文字体
rcParams['font.sans-serif'] = ['SimHei']  # 使用黑体字体
rcParams['axes.unicode_minus'] = False    # 解决负号 '-' 显示为方块的问题
app = Flask(__name__)
CORS(app)

# 发信方信息
from_addr = '3192179121@qq.com'
password = 'lgvodkhugxxzdhcg'
smtp_server = 'smtp.qq.com'

# 图片转换函数
def avif_to_jpg(avif_file_path, output_file_path):
    try:
        with open(avif_file_path, 'rb') as f:
            avif_data = base64.b64encode(f.read()).decode('utf-8')
        avif_data = f"data:image/avif;base64,{avif_data}"
        img_data = avif_data.split(',')[-1]
        byte_data = base64.b64decode(img_data)
        byte_stream = BytesIO(byte_data)
        image = Image.open(byte_stream)
        image.save(output_file_path, 'JPEG')
        return True
    except Exception as e:
        print(f"AVIF 转换失败: {e}")
        return False

# 爬取 1688 商品
def search_1688_products(keyword):
    encoded_keyword = urllib.parse.quote(keyword)
    url = f'https://p4psearch.1688.com/page.html?hpageId=old-sem-pc-list&keywords={encoded_keyword}'
    driver = webdriver.Chrome()
    driver.get(url)
    time.sleep(2)
    driver.execute_script("window.scrollBy(0, 2000);")
    time.sleep(1)

    divs = driver.find_elements(By.CSS_SELECTOR, '.offer_exp')
    products = []
    for count, div in enumerate(divs):
        if count >= 10:
            break
        try:
            title = div.find_element(By.CSS_SELECTOR, '.offer-title span').text
            price = div.find_element(By.CSS_SELECTOR, '.offer-price span').text
            img_url = div.find_element(By.CSS_SELECTOR, '.offer-img img').get_attribute('src')
            href = div.find_element(By.CSS_SELECTOR, 'a').get_attribute('href')
            img_name = f"{keyword}_1688_img{count + 1}.jpg"
            img_path = os.path.join('frontend', 'static', 'imgs', img_name)
            os.makedirs(os.path.dirname(img_path), exist_ok=True)
            img_data = requests.get(img_url).content
            with open(img_path, 'wb') as img_file:
                img_file.write(img_data)

            products.append({
                'name': keyword,
                'detail': title,
                'price': price,
                'img_guid': img_name,
                'plat': '1688',
                'href': href
            })
        except Exception as e:
            print(f"1688解析商品信息失败: {e}")
    driver.quit()
    return products

# 爬取苏宁商品
def search_suning_products(keyword):
    url = f'https://search.suning.com/{keyword}/'
    driver = webdriver.Chrome()
    driver.get(url)
    time.sleep(5)
    driver.execute_script("window.scrollBy(0, 1000);")  # 向下滚动1000像素
    time.sleep(1)  # 等待加载
    driver.execute_script("window.scrollBy(0, 1000);")
    time.sleep(1)
    driver.execute_script("window.scrollBy(0, 1000);")
    time.sleep(1)
    driver.execute_script("window.scrollBy(0, 1000);")
    time.sleep(1)

    divs = driver.find_elements(By.CSS_SELECTOR, '.product-box')
    products = []
    for count, div in enumerate(divs):
        if count >= 10:
            break
        try:
            title = div.find_element(By.CSS_SELECTOR, '.title-selling-point').text
            price = div.find_element(By.CSS_SELECTOR, '.price-box').text
            img_url = div.find_element(By.CSS_SELECTOR, '.img-block img').get_attribute('src')
            href = div.find_element(By.CSS_SELECTOR, '.title-selling-point a').get_attribute('href')
            img_name = f"SN_{keyword}_{count + 1}.jpg"
            img_path = os.path.join('frontend', 'static', 'imgs', img_name)
            os.makedirs(os.path.dirname(img_path), exist_ok=True)
            img_data = requests.get(img_url).content
            with open(img_path, 'wb') as img_file:
                img_file.write(img_data)

            products.append({
                'name': keyword,
                'detail': title,
                'price': price,
                'img_guid': img_name,
                'plat': '苏宁',
                'href': href
            })
        except Exception as e:
            print(f"苏宁解析商品信息失败: {e}")
    driver.quit()
    return products

# 爬取京东商品
def search_jd_products(keyword):
    dp = ChromiumPage()
    dp.get('https://www.jd.com/')
    dp.ele('css:#key').input(keyword)
    dp.ele('css:.button').click()

    time.sleep(2)
    for _ in range(17):  # 可以根据需要调整滑动次数
        dp.scroll.down(400)
        time.sleep(1)

    lis = dp.eles('css:.gl-item')
    products = []
    for idx, li in enumerate(lis, 1):
        try:
            title = li.ele('css:.p-name a em').text
            price = li.ele('css:.p-price strong i').text
            img_url = li.ele('css:.p-img a img').attr('src')
            href = li.ele('css:.p-img a').attr('href')
            if img_url.startswith('//'):
                img_url = 'https:' + img_url
            avif_img_name = f"JD_{keyword}_{idx}.avif"
            jpg_img_name = avif_img_name.replace('.avif', '.jpg')
            avif_img_path = os.path.join('frontend', 'static', 'imgs', avif_img_name)
            jpg_img_path = os.path.join('frontend', 'static', 'imgs', jpg_img_name)

            img_data = requests.get(img_url).content
            os.makedirs(os.path.dirname(avif_img_path), exist_ok=True)
            with open(avif_img_path, 'wb') as img_file:
                img_file.write(img_data)

            if avif_to_jpg(avif_img_path, jpg_img_path):
                img_name = jpg_img_name
            else:
                img_name = "转换失败"

            products.append({
                'name': keyword,
                'detail': title,
                'price': price,
                'img_guid': img_name,
                'plat': '京东',
                'href': href
            })
        except Exception as e:
            print(f"京东解析商品信息失败: {e}")
    dp.quit()
    return products

# 商品查询路由
# 商品查询路由
@app.route('/hello', methods=['GET'])
def hello_world():
    name = request.args.get('name', '')
    if not name:
        return jsonify({"message": "商品名称不能为空", "data": []}), 400

    print(f"接收到的请求参数: {name}")

    try:
        products_1688 = search_1688_products(name)
        products_suning = search_suning_products(name)
        products_jd = search_jd_products(name)
    except Exception as e:
        print(f"爬取商品数据失败: {e}")
        return jsonify({"message": "爬取商品数据失败", "data": []}), 500

    all_products = products_1688 + products_suning + products_jd

    # 提取并处理价格字段，删除符号并保留数字
    def extract_price(price_str):
        # 使用正则表达式提取数字部分
        match = re.search(r'\d+(\.\d+)?', price_str)
        if match:
            return float(match.group())
        return 0.0  # 如果没有找到数字，默认返回0.0

    # 按价格排序
    try:
        all_products = sorted(all_products, key=lambda x: extract_price(x['price']), reverse=False)
    except Exception as e:
        print(f"排序失败: {e}")

    return jsonify({
        "message": "Products fetched successfully",
        "data": all_products
    })


# 降价提醒邮件
@app.route('/sendPriceAlert', methods=['GET'])
def send_price_alert():
    user_name = request.args.get('name', '')
    product_name = request.args.get('productName', '')
    user_email = request.args.get('address', '')
    if not user_name or not product_name or not user_email:
        return jsonify({"message": "用户名字、商品名称和邮箱地址不能为空"}), 400

    content = f"尊敬的 {user_name}，\n\n我们注意到您关注的商品【{product_name}】近期出现了降价，请尽快查看并考虑是否购买。"
    msg = MIMEText(content, 'plain', 'utf-8')
    msg['From'] = Header(from_addr)
    msg['To'] = Header(user_email)
    msg['Subject'] = Header(f'商品降价提醒：{product_name}')

    try:
        server = smtplib.SMTP_SSL(smtp_server, 465)
        server.login(from_addr, password)
        server.sendmail(from_addr, user_email, msg.as_string())
        server.quit()
        return jsonify({"message": "降价提醒邮件已发送"}), 200
    except Exception as e:
        print(f"发送邮件失败: {e}")
        return jsonify({"message": "邮件发送失败"}), 500

# 生成折线图
@app.route('/chart', methods=['GET'])
def generate_chart():
    global image_counter

    dates = request.args.getlist('dates[]')
    prices = request.args.getlist('prices[]')

    # 验证日期和价格参数是否有效
    if not dates or not prices or len(dates) != len(prices):
        return jsonify({'error': '日期和价格参数无效'}), 400

    price_list = [float(price) for price in prices]

    # 生成图片的文件名
    image_counter += 1
    if image_counter > 9999:  # 如果计数器大于 9999，则重置为 1
        image_counter = 1

    # 生成新的文件名，格式为 price_change_n.jpg，n为数字
    image_filename = f'price_change_{image_counter:04d}.jpg'
    image_path = os.path.join('frontend', 'static', 'imgs', image_filename)

    # 创建目录（如果不存在）
    os.makedirs(os.path.dirname(image_path), exist_ok=True)

    # 生成价格变化趋势图
    plt.figure(figsize=(10, 6), dpi=100)
    plt.plot(dates, price_list, marker='o', linestyle='-', color='b')
    plt.xlabel('日期')
    plt.ylabel('价格')
    plt.title('价格变化趋势')
    plt.xticks(rotation=45)
    plt.tight_layout()

    # 保存图表为图片
    plt.savefig(image_path, format='jpg')
    plt.close()

    # 返回生成的图片名称作为字符串
    return jsonify({'imagePath': str(image_filename)}), 200


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
