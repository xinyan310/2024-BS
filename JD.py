
# 导入自动化模块
from DrissionPage import ChromiumPage
# 导入csv模块
import csv
# 导入时间模块
import time
# 创建文件对象
f = open('data.csv', mode='w', encoding='utf-8', newline='')
# csv字典写入的方法
csv_writer = csv.DictWriter(f, fieldnames=['标题', '价格', '图片', '店铺'])
# 写入表头
csv_writer.writeheader()

# 打开浏览器 (实例化浏览器对象) -> dp浏览器
dp = ChromiumPage()
# 访问网站
dp.get('https://www.jd.com/')
# 输入商品关键字
dp.ele('css:#key').input('粽子')
# 点击搜索按钮
dp.ele('css:.button').click()

for page in range(1, 11):
    # 延时等待
    time.sleep(20)
    # 下滑整个网页页面
    dp.scroll.to_bottom()
    """获取商品相关数据信息"""
    # 获取所有商品信息所在li标签 -> 在python解析数据获取多个, 返回基本列表
    lis = dp.eles('css:.gl-item')
    #print(lis)
    # for循环遍历, 提取列表里面元素
    for li in lis:
        """提取具体商品数据信息"""
        title = li.ele('css:.p-name a em').text # 商品名字
        price = li.ele('css:.p-price strong i').text # 价格
        img = li.ele('css:.p-img a img').attr('src') # 评论
        shop = li.ele('css:.hd-shopname').text # 店铺名
        # 把数据保存字典里面
        dit = {
            '标题': title,
            '价格': price,
            '图片': img,
            '店铺': shop,
        }
        # 写入数据
        csv_writer.writerow(dit)
        print(dit)
    #点击下一页按钮
    dp.ele('css:.pn-next').click()