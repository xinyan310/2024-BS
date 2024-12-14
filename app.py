# coding=utf-8
from flask import Flask, jsonify, request, send_from_directory
from flask_cors import CORS
import smtplib
from email.mime.text import MIMEText
from email.header import Header
import time
import os
import requests
from selenium import webdriver
from selenium.webdriver.common.by import By
import urllib.parse
import matplotlib.pyplot as plt
import uuid
from datetime import datetime

app = Flask(__name__)
# 允许跨域请求
CORS(app)

# 发信方的信息：发信邮箱，QQ 邮箱授权码
from_addr = '3192179121@qq.com'
password = 'lgvodkhugxxzdhcg'

# 发信服务器
smtp_server = 'smtp.qq.com'

def send_email(to_addr, user_name, product_name):
    """
    发送降价提醒邮件给用户
    """
    # 邮件正文内容，包含用户名字和商品名称
    content = f"尊敬的 {user_name}，\n\n我们注意到您关注的商品【{product_name}】近期出现了降价，请尽快查看并考虑是否购买。"

    # 创建邮件对象
    msg = MIMEText(content, 'plain', 'utf-8')
    msg['From'] = Header(from_addr)
    msg['To'] = Header(to_addr)
    msg['Subject'] = Header(f'商品降价提醒：{product_name}')

    try:
        # 开启发信服务，这里使用的是加密传输
        server = smtplib.SMTP_SSL(smtp_server, 465)
        # 登录发信邮箱
        server.login(from_addr, password)
        # 发送邮件
        server.sendmail(from_addr, to_addr, msg.as_string())
        # 关闭服务器
        server.quit()
        print(f"降价提醒邮件已发送给 {to_addr}，商品：{product_name}")
    except Exception as e:
        print(f"发送邮件失败：{e}")

def search_products(keyword):
    """
    使用 Selenium 爬取 1688 网站上的商品信息
    """
    # URL 编码处理
    encoded_keyword = urllib.parse.quote(keyword)

    # 拼接网址
    url = f'https://p4psearch.1688.com/page.html?hpageId=old-sem-pc-list&keywords={encoded_keyword}&cosite=baidujj_pz&location=re&trackid=885662561117990122602&spm=a2638t.b_30496503.szyx_head.submit&keywordid=&bt=&exp=pcCpxGuessExp%3AA&ptid=hr1066c8189143a1'

    # 启动 Selenium WebDriver（确保已安装对应的 WebDriver）
    driver = webdriver.Chrome()

    # 打开拼接好的网址
    driver.get(url)

    # 等待页面加载
    time.sleep(3)  # 增加等待时间以确保页面完全加载

    # 提取数据
    divs = driver.find_elements(By.CSS_SELECTOR, '.offer_exp')
    count = 0
    products = []

    for div in divs:
        if count >= 10:  # 限制只抓取10个商品
            break

        try:
            title = div.find_element(By.CSS_SELECTOR, '.offer-title span').text  # 商品名称
            price = div.find_element(By.CSS_SELECTOR, '.offer-price span').text  # 商品价格
            img_url = div.find_element(By.CSS_SELECTOR, '.offer-img img').get_attribute('src')  # 商品图片URL

            # 获取商品描述（这里我们将title作为商品描述）
            detail = title  # 将标题作为商品的描述

            # 生成图片文件名作为 img_guid
            img_data = requests.get(img_url).content
            img_name = f"{keyword}_1688_img{count + 1}.jpg"
            img_guid = img_name  # 使用文件名作为唯一标识符
            img_path = os.path.join('frontend', 'static', 'imgs', img_name)

            # 如果图片保存目录不存在，创建目录
            img_dir = os.path.dirname(img_path)
            if not os.path.exists(img_dir):
                os.makedirs(img_dir)

            with open(img_path, 'wb') as f_img:
                f_img.write(img_data)

            print(f"图片已保存: {img_path}")

            # 保存商品信息
            product = {
                'name': title,        # 商品名称
                'detail': detail,     # 商品描述
                'price': price,       # 商品价格
                'img_guid': img_guid, # 商品图片的文件名
                'plat': '1688'        # 平台名称
            }
            products.append(product)
            count += 1
            print(title, price, img_url)
        except Exception as e:
            print(f"解析商品信息失败: {e}")

    # 关闭浏览器
    driver.quit()

    # 返回抓取的产品信息列表
    return products

@app.route('/hello', methods=['GET'])
def hello_world():
    """
    原有的 /hello 路由，用于根据商品名称爬取商品信息并返回
    """
    # 获取请求参数 'name'（商品名称）
    name = request.args.get('name', '')  # 获取前端传来的 'name' 参数，默认为空字符串
    print(f"接收到的请求参数: {name}")  # 输出请求参数到控制台

    # 调用爬虫函数获取商品数据
    products = search_products(name)

    # 返回抓取的产品数据
    return jsonify({
        "message": "Products fetched successfully",
        "data": products
    })

@app.route('/sendPriceAlert', methods=['GET'])
def send_price_alert():
    """
    新增的 /sendPriceAlert 路由，用于发送降价提醒邮件
    """
    # 获取请求参数
    user_name = request.args.get('name', '')           # 获取用户的名字
    product_name = request.args.get('productName', '') # 获取商品名称
    user_email = request.args.get('address', '')       # 获取用户邮箱地址

    print(f"用户名字: {user_name}, 邮箱地址: {user_email}, 商品名称: {product_name}")

    # 确保用户名字、商品名称和邮箱地址都传入
    if not user_name or not product_name or not user_email:
        return jsonify({
            "message": "用户名字、商品名称和邮箱地址不能为空"
        }), 400  # 返回400错误码表示请求有误

    # 直接发送降价提醒邮件
    send_email(user_email, user_name, product_name)

    # 返回成功响应
    return jsonify({
        "message": "降价提醒邮件已发送",
        "data": []
    }), 200  # 返回200成功码

@app.route('/chart', methods=['GET'])
def generate_chart():
    """
    新增的 /chart 路由，用于接收日期和价格数据，生成折线图并返回图片路径
    """
    try:
        # 获取日期和价格参数
        dates = request.args.getlist('dates[]')   # 修改为接收列表
        prices = request.args.getlist('prices[]') # 修改为接收列表

        if not dates or not prices:
            return jsonify({'error': '缺少日期或价格参数'}), 400

        if len(dates) != len(prices):
            return jsonify({'error': '日期和价格数量不匹配'}), 400

        # 将价格转换为浮点数
        try:
            price_list = [float(price) for price in prices]
        except ValueError:
            return jsonify({'error': '价格必须是数字'}), 400

        # 生成唯一的图片名称，避免覆盖
        unique_id = uuid.uuid4().hex
        image_filename = f'game_scores_{unique_id}.jpg'
        image_path = os.path.join('frontend', 'static', 'imgs', image_filename)

        # 确保图片保存目录存在
        img_dir = os.path.dirname(image_path)
        if not os.path.exists(img_dir):
            os.makedirs(img_dir)

        # 绘制图表
        plt.figure(figsize=(10, 6), dpi=100)
        plt.plot(dates, price_list, marker='o', linestyle='-', color='b')
        plt.xlabel('日期')
        plt.ylabel('价格')
        plt.title('价格变化趋势')
        plt.xticks(rotation=45)
        plt.tight_layout()  # 自动调整子图参数以给标签留出足够的空间

        # 保存图表为图片
        plt.savefig(image_path, format='jpg')
        plt.close()  # 关闭图表，释放内存

        # 构建图片的 URL 路径
        # 假设 Flask 应用和前端应用在同一域名下
        image_url = f'/static/imgs/{image_filename}'

        return jsonify({'imagePath': image_url}), 200

    except Exception as e:
        print(f'Error generating chart: {e}')
        return jsonify({'error': '服务器内部错误'}), 500

# 如果需要提供静态文件访问（通常 Flask 已经配置了静态文件路由）
# 可以确保前端可以访问 /static/imgs/<filename>

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
