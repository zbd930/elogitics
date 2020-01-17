package test.com.duogesi.controller; 

import com.duogesi.Utils.Httputils;
import org.junit.Test;
import org.junit.Before; 
import org.junit.After;

import java.util.HashMap;

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
    Httputils httputils=new Httputils();
    HashMap map=new HashMap();
    map.put("name","zbd93930");
    map.put("password","zbd7895123");
    httputils.doPost("http://localhost:8090/User/login.do", map,"UTF-8");
} 


} 
