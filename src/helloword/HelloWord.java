package helloword;

import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Random;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

public class HelloWord {
    
    public static void main(String[] args) throws IOException, TemplateException {
       
        //创建Freemarket配置实例
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_23);
        cfg.setDirectoryForTemplateLoading(new File("templates")); //项目同级目录
        cfg.setDefaultEncoding("UTF-8");
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        
        //创建数据模型(树装结构)
         HashMap<Object, Object> root = new HashMap<>();
         root.put("userName", "Mr.TianShu");
         root.put("random", new Random().nextInt(100));
         
         //加载模板文件
         Template t1 = cfg.getTemplate("helloWorld.ftl");
         
         //显示生成的数据
         Writer out = new OutputStreamWriter(System.out);
         t1.process(root, out);
         out.flush();
         out.close();
    }
}