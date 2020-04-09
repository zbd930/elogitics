package test.com.duogesi.controller; 

import org.junit.Test;
import org.junit.Before; 
import org.junit.After;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

/** 
* Userservlet Tester. 
* 
* @author <Authors name> 
* @since <pre>���� 19, 2019</pre> 
* @version 1.0 
*/ 
public class UserservletTest { 

@Before
public void before() throws Exception { 
} 

@After
public void after() throws Exception { 
} 

/** 
* 
* Method: login(String name, String password, HttpServletResponse response) 
* 
*/ 
@Test
public void testLogin() throws Exception {
    File file=new File("C:\\Users\\Administrator\\Desktop\\Qazwsx83.txt");
    InputStream inputStream=null;
    inputStream=new FileInputStream(file);
    byte [] bytes=new byte[1024];
    int result=inputStream.read(bytes);
    String [] strings=new String(bytes,0,result).split("");
    for (int i = 0; i <strings.length ; i++) {
        System.out.println(strings[i]);
    }

//    Httputils httputils=new Httputils();
//    HashMap map=new HashMap();
//    map.put("name","zbd93930");
//    map.put("password","zbd7895123");
//    httputils.doPost("http://localhost:8090/User/login.do", map,"UTF-8");
} 


} 
