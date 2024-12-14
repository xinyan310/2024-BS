package com.shanzhu.flower.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.ResponseEntity;
import java.io.BufferedReader;
import java.io.InputStreamReader;

@RestController
public class ProductSearchController {

    @GetMapping("/api/searchProduct")
    public ResponseEntity<String> searchProduct(@RequestParam String name) {
        try {
            // Python 程序的路径
            String pythonScriptPath = "D:\\my_ZJU\\BS\\2024-BS\\1688_.py";

            // 构建命令，调用 Python 脚本并传递参数
            String command = "python3 " + pythonScriptPath + " " + name;

            // 执行命令
            Process process = Runtime.getRuntime().exec(command);

            // 获取 Python 程序的输出
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            StringBuilder result = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                result.append(line);
            }

            // 等待 Python 程序执行完毕
            process.waitFor();

            // 返回抓取的 JSON 数据
            return ResponseEntity.ok(result.toString());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("调用 Python 程序失败");
        }
    }
}

