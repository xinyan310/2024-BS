# coding=utf-8
import matplotlib.pyplot as plt
import os

plt.figure(figsize=(20, 10), dpi=100)
game = ['1-G1', '1-G2', '1-G3', '1-G4', '1-G5', '2-G1', '2-G2', '2-G3', '2-G4', '2-G5',
        '3-G1', '3-G2', '3-G3', '3-G4', '3-G5', '总决赛-G1', '总决赛-G2', '总决赛-G3',
        '总决赛-G4', '总决赛-G5', '总决赛-G6']
scores = [23, 10, 38, 30, 36, 20, 28, 36, 16, 29, 15, 26, 30, 26, 38, 34, 33, 25, 28, 40, 28]

plt.plot(game, scores)
plt.xlabel('游戏阶段')
plt.ylabel('得分')
plt.title('游戏得分趋势')
plt.xticks(rotation=45)

# 构建并检查目录
directory = os.path.join('frontend', 'static', 'imgs')
if not os.path.exists(directory):
    os.makedirs(directory)

# 保存为 jpg 文件
path = os.path.join(directory, 'game_scores.jpg')
plt.savefig(path, format='jpg')

# 显示图像
plt.show()
